import os
#import psycopg2
from flask import Flask, render_template, g, redirect, url_for, session, request, jsonify
from flask_oauthlib.client import OAuth

from flask_debugtoolbar import DebugToolbarExtension
import logging


app = Flask(__name__)
app.config['SECRET_KEY'] = os.environ.get('SECRET_KEY', 'XYZ')
toolbar = DebugToolbarExtension(app)


# def connect_db():
#     return psycopg2.connect(os.environ.get('DATABASE_URL'))


# @app.before_request
# def before_request():
#     g.db_conn = connect_db()


# @app.route('/')
# def index():
#     cur = g.db_conn.cursor()
#     cur.execute("SELECT * FROM country;")
#     return render_template('index.html', countries=cur.fetchall())

# app = Flask(__name__)


app.debug = True
# app.secret_key = 'development'
oauth = OAuth(app)

linkedin = oauth.remote_app(
    'linkedin',
    consumer_key='77u05yrx7rjl2w',
    consumer_secret='wqJjQS5WuExBqdqv',
    request_token_params={
        'scope': 'r_basicprofile',
        'state': 'RandomString',
    },
    base_url='https://api.linkedin.com/v1/',
    request_token_url=None,
    access_token_method='POST',
    access_token_url='https://www.linkedin.com/uas/oauth2/accessToken',
    authorize_url='https://www.linkedin.com/uas/oauth2/authorization',

)


@app.route('/')
def index():
    logging.warning(session)
    if 'linkedin_token' in session:
        me = linkedin.get('people/~')
        return jsonify(me.data)
    return redirect(url_for('login'))


@app.route('/login')
def login():
    return linkedin.authorize(callback=url_for('authorized', _external=True))


@app.route('/logout')
def logout():
    #session.pop('linkedin_token', None)
    session.clear()
    logging.warning(session)
    return url_for('index')

@app.route('/login/authorized')
def authorized():
    resp = linkedin.authorized_response()
    if resp is None:
        return 'Access denied: reason=%s error=%s' % (
            request.args['error_reason'],
            request.args['error_description']
        )
    session['linkedin_token'] = (resp['access_token'], '')
    me = linkedin.get('people/~')
    return jsonify(me.data)


@linkedin.tokengetter
def get_linkedin_oauth_token():
    return session.get('linkedin_token')


def change_linkedin_query(uri, headers, body):
    auth = headers.pop('Authorization')
    headers['x-li-format'] = 'json'
    if auth:
        auth = auth.replace('Bearer', '').strip()
        if '?' in uri:
            uri += '&oauth2_access_token=' + auth
        else:
            uri += '?oauth2_access_token=' + auth
    return uri, headers, body

linkedin.pre_request = change_linkedin_query


if __name__ == '__main__':
    app.run()
