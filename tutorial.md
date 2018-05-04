# Flask Heroku Tutorial
_(This repo is part of the [Free Flask Tutorial](https://flask-tutorial.com))_

This repo contains some sample code to deploy a simple (but complete) Flask application to [Heroku](https://heroku.com). The deployed app counts with the following features:

* Running Python 3.6 🐍
* Access to a Postgres Database 📘
* Static Files management with [WhiteNoise](http://whitenoise.evans.io/en/stable/) 🔌

**There's a detailed video lesson on how to perform the deploy in our [Free Flask Tutorial](https://flask-tutorial.com).**

## Summary of steps to deploy your app
_(Assuming you've already created an account with Heroku)_

##### 1. Clone the repo
```bash
git clone https://github.com/rmotr-curriculum/flask-heroku-example.git && cd flask-heroku-example
git clone https://github.com/suziray/nextpath.git && cd nextpath
```

##### 2. Login to Heroku
```bash
heroku login
```

##### 3. Create your Heroku apps
```bash
heroku create ct-nextpath
```

##### 4. Set the Python Path
```bash
heroku config:set PYTHONPATH=flask_heroku_example
heroku config:set PYTHONPATH=nextpath
```

##### 5. Add Postgres Add-on to your Heroku app
(Use Heroku's site to add Postgres. It's free)

##### 6. Initialize the Database
```bash
# Clear database
heroku pg:reset DATABASE --confirm ct-nextpath
# Create the initial schema
heroku pg:psql < schema.sql
# Load some initial testing data
heroku pg:psql < initial_data.sql
```

##### 7. Deploy & Profit
```bash
git add .
git commit -m "some comment"
git push
git push heroku master
```

## Running the app locally
_(You need to have installed Postgres locally to run the app. For a simpler sqlite alternative, please check the aforementioned tutorial)_

```bash
# Install virtualenv
pip install virtualenv
# Create virtualenv
virtualenv nextp
# Activate the virtualenv
source nextp/bin/activate
# Install dependencies
pip install -r requirements.txt
# Run the app
python nextpath/main.py
# Now point your browser to localhost:5000
```
