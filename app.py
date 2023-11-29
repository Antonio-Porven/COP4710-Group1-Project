from flask import Flask, render_template, redirect, url_for, request
from flask_sqlalchemy import SQLAlchemy

app = Flask(__name__)
#importing the database
#change password to your database password this is just a default password
app.config ["SQLALCHEMY_DATABASE_URI"] = 'mysql+pymysql://root:password@localhost/universityDB'

# We create a sql object
db = SQLAlchemy(app)


class Students(db.Model):
    __tablename__ = 'students'
    studentid = db.Column(db.Integer, primary_key=True)
    fname = db.Column(db.String(45), nullable=False)
    lname = db.Column(db.String(45), nullable=False)
    dateofbirth = db.Column(db.Date, nullable=False)
    major = db.Column(db.String(45), nullable=False)
    advisorid = db.Column(db.Integer, nullable=False)
    email = db.Column(db.String(50), nullable=False)  # Fixed typo in SQL file
    gpa = db.Column(db.DECIMAL(10, 2), nullable=False)  # Adjusted to DECIMAL(10, 2)

class Enrollment(db.Model):
    __tablename__ = 'enrollment'
    enrollmentid = db.Column(db.Integer, primary_key=True)
    studentid = db.Column(db.Integer, nullable=False)
    classid = db.Column(db.Integer, nullable=False)
    semesterid = db.Column(db.Integer, nullable=False)
    enrollmentdate = db.Column(db.Date, nullable=False)
    grade = db.Column(db.String(1), nullable=False)
    count = db.Column(db.SmallInteger, nullable=False)

class Classes(db.Model):  
    __tablename__ = 'classes'
    classid = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(25), nullable=False)
    professorid = db.Column(db.Integer, nullable=False)
    capacity = db.Column(db.SmallInteger, nullable=False)
    departmentid = db.Column(db.Integer, nullable=False)
    credits = db.Column(db.SmallInteger, nullable=False)
    description = db.Column(db.String(100))  # Added missing data type for description

class Semester(db.Model):
    __tablename__ = 'semester'
    semesterid = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(20), nullable=False)
    startdate = db.Column(db.Date, nullable=False)
    enddate = db.Column(db.Date, nullable=False)
    academicyear = db.Column(db.Integer, nullable=False)  # Changed to INTEGER from YEAR

class Staff(db.Model): 
    __tablename__ = 'staff'
    staffid = db.Column(db.Integer, primary_key=True)
    fname = db.Column(db.String(40), nullable=False)
    lname = db.Column(db.String(40), nullable=False)
    role = db.Column(db.String(40), nullable=False)
    email = db.Column(db.String(50), nullable=False)
    departmentid = db.Column(db.Integer, nullable=False)

class Professors(db.Model):  # Corrected table name from 'professor' to 'professors'
    __tablename__ = 'professors'
    professorid = db.Column(db.Integer, primary_key=True)
    fname = db.Column(db.String(40), nullable=False)
    lname = db.Column(db.String(40), nullable=False)
    departmentid = db.Column(db.Integer, nullable=False)
    email = db.Column(db.String(50), nullable=False)

class Department(db.Model):
    __tablename__ = 'department'
    departmentid = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(40), nullable=False)
    departmentheadid = db.Column(db.Integer, nullable=False)
    location = db.Column(db.String(50), nullable=False)
    email = db.Column(db.String(50), nullable=False)

#dummy page really does nothing
@app.route('/home')
def hello_world():  # put application's code here
    return render_template('home.html')


#Login Page
@app.route('/login', methods=['GET', 'POST'])
@app.route('/', methods=['GET', 'POST'])
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
    db.create_all()
    app.run(debug=True)


"""
Run these commands in the terminal to initialize the database

flask db init  # Initialize migrations (only need to run once)
flask db migrate -m "Initial migration"  # Create an initial migration
flask db upgrade  # Apply the migration to the database
"""