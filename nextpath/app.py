import os
import psycopg2
from flask import Flask, render_template, g, redirect, url_for, session, request, jsonify
from flask_oauthlib.client import OAuth

from flask_debugtoolbar import DebugToolbarExtension
import logging
import json

from werkzeug.utils import secure_filename
 
UPLOAD_FOLDER = '/static'
ALLOWED_EXTENSIONS = set(['txt', 'pdf', 'png', 'jpg', 'jpeg', 'gif'])


app = Flask(__name__)
app.config['SECRET_KEY'] = os.environ.get('SECRET_KEY', 'XYZ')
app.config['UPLOAD_FOLDER'] = UPLOAD_FOLDER
toolbar = DebugToolbarExtension(app)
oauth = OAuth(app)


class usr:
    def __init__(self,usr_dict):
        self.firstName = usr_dict['firstName']
        self.lastName = usr_dict['lastName']

    def fetch_first_name(self):
        return self.firstName

def connect_db():
    return psycopg2.connect(os.environ.get('DATABASE_URL'))


@app.before_request
def before_request():
    g.db_conn = connect_db()


#@app.route('/usr')
def get_usr(first_name):
    cur = g.db_conn.cursor()
    cur.execute("SELECT * FROM usr where first_name = '" + first_name + "'")
    return render_template('welcome.html', users=cur.fetchall())


def match(usr_tags, chg_skills):
    chg_skills = chg_skills.split(',')
    for tags in usr_tags:
        ts = tags[0].split(',')
        for t in ts:
            for s in chg_skills:
                if t.lower() == s.lower():
                    return True
    return False


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
        session['name'] = usr(dict(me.data)).fetch_first_name()
        return render_template('index.html', usr_first_name=session['name'])
    else:
        return redirect(url_for('login'))


@app.route('/login')
def login():
    return linkedin.authorize(callback=url_for('authorized', _external=True))


@app.route('/logout')
def logout():
    session.pop('linkedin_token', None)
    session.clear()
    logging.warning(session)
    return redirect(url_for('login'))


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
    session['name'] = usr(dict(me.data)).fetch_first_name()
    logging.warning(session['name'])
    return render_template('index.html', usr_first_name=session['name'])


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

@app.route('/profile')
def profile():
    logging.warning(session)
    if 'linkedin_token' in session:
        me = linkedin.get('people/~')
        session['name'] = usr(dict(me.data)).fetch_first_name()
        cur = g.db_conn.cursor()
        prf_sql = "SELECT experience.title, experience.company, experience.duration, experience.description, experience.tags FROM experience,usr WHERE experience.usr_id=usr.id AND usr.first_name= '" + session['name'] + "'"
        cur.execute(prf_sql)
        return render_template('profile.html', experiences=cur.fetchall())
    return redirect(url_for('login'))


@app.route('/challenges')
def challenges():
    logging.warning(session)
    if 'linkedin_token' in session:
        me = linkedin.get('people/~')
        session['name'] = usr(dict(me.data)).fetch_first_name()
        cur = g.db_conn.cursor()
        sql = "SELECT project.title, project.skill, project.description, companyprojectrel.start_time, companyprojectrel.expire_time, company.url FROM project,companyprojectrel,company where project.id=companyprojectrel.project_id AND companyprojectrel.company_id=company.id"
        cur.execute(sql)
        projects = cur.fetchall()
        sql = "SELECT experience.tags FROM experience,usr WHERE experience.usr_id=usr.id AND usr.first_name= '" + session['name'] + "'"
        cur.execute(sql)
        usr_tags = cur.fetchall()
        valid_projects = []
        for proj in projects:
            if match(usr_tags, proj[1]):
                valid_projects.append(proj)
        logging.warning(valid_projects)
        return render_template('challenges.html', challenges=valid_projects)
    return redirect(url_for('login'))


####upload files######
def allowed_file(filename):
    return '.' in filename and \
           filename.rsplit('.', 1)[1].lower() in ALLOWED_EXTENSIONS
 
@app.route('/upload', methods=['GET', 'POST'])
def upload_file():
    if request.method == 'POST':
        # check if the post request has the file part
        if 'file' not in request.files:
            flash('No file part')
            return redirect(request.url)
        file = request.files['file']
        # if user does not select file, browser also
        # submit a empty part without filename
        if file.filename == '':
            flash('No selected file')
            return redirect(request.url)
        if file and allowed_file(file.filename):
            filename = secure_filename(file.filename)
            basedir = os.path.abspath(os.path.dirname(__file__))
            file.save(os.path.join(basedir, app.config['UPLOAD_FOLDER'], filename))
            return redirect(url_for('login'))
    return render_template("upload.html")

if __name__ == '__main__':
    app.run()

