from flask import Flask, render_template, redirect, url_for, request


app = Flask(__name__)


@app.route('/home')
def hello_world():  # put application's code here
    return render_template('home.html')

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

@app.route('/signup')
def signup():  # put application's code here
    return render_template('signup.html')

if __name__ == '__main__':
    app.run(debug=True)
