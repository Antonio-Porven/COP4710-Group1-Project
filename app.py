from flask import Flask, render_template, redirect, url_for, request
from flask_sqlalchemy import SQLAlchemy

app = Flask(__name__)
#importing the database
#change password to your database password this is just a default password
app.config ["SQLALCHEMY_DATABASE_URI"] = 'mysql+pymysql://root:password@localhost/universityDB'

#dummy page really does nothing
@app.route('/home')
def hello_world():  # put application's code here
    return render_template('home.html')


#Login Page
@app.route('/login')
@app.route('/')
def login():
    error = None
    if request.method == 'POST':
        if request.form['username'] != 'admin' or request.form['password'] != 'admin':
            error = 'Invalid Credentials. Please try again.'
        else:
            return redirect(url_for('home'))
    return render_template('login.html', error=error)


#Signup Page
@app.route('/signup')
def signup():  # put application's code here
    return render_template('signup.html')

if __name__ == '__main__':
    app.run(debug=True)
