import time
from flask import Flask, render_template, flash, redirect, request, url_for, jsonify
from flask_sqlalchemy import SQLAlchemy


DBUSER = 'marco'
DBPASS = 'foobarbaz'
DBHOST = 'db'
DBPORT = '5432'
DBNAME = 'testdb'


app = Flask(__name__)
# app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///students.sqlite3'
app.config['SQLALCHEMY_DATABASE_URI'] = \
    'postgresql+psycopg2://{user}:{passwd}@{host}:{port}/{db}'.format(
        user=DBUSER,
        passwd=DBPASS,
        host=DBHOST,
        port=DBPORT,
        db=DBNAME)
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
app.secret_key = 'foobarbaz'


db = SQLAlchemy(app)


class users(db.Model):
    id = db.Column('user_id', db.Integer, primary_key=True)
    name = db.Column(db.String(100))
    email = db.Column(db.String(50))
    password = db.Column(db.String(100))

    def __init__(self, name, email, password):
        self.name = name
        self.email = email
        self.password = password


def database_initialization_sequence():
    db.create_all()
    test_rec = users(
            'haritha',
            'haritha@gmail.com ',
            'devpassword')

    db.session.add(test_rec)
    db.session.rollback()
    db.session.commit()

# Test function
@app.route('/', methods=['GET', 'POST'])
def home():
    print("\n\n  TESTING HOME.............................. ")

    value = users('me', 'me@gmail.com', 'devpassword')
    db.session.add(value)
    db.session.commit

    answer = db.session.query(users).all()

    return jsonify({"message": answer[0].email}), 200

# Test Login
@app.route('/login/', methods=['GET', 'POST'])
def login():

    response = {
        'message': ' Please Enter the data'
    }
    code = 422

    print("\n\n\n\n..............0")

    if request.method == 'POST':

        print("\n\n\n\n................................ 1")

        username = request.args.get('username')
        print("\n\n\n username", username)
        password = request.args.get('password')
        print("\n\n\n password", password)

        if username is not None and password is not None:
            result = db.session.query(users).filter(users.name == username, users.password == password).first()
            if result:
                response = {
                    'message': 'Successfully Logged In'
                }
                code = 200
            else:
                response = {
                    'message': 'This User doesnt exists'
                }
                code = 404

    print("\n\n\n\n..............2")

    return jsonify(response), code


if __name__ == '__main__':
    dbstatus = False
    while dbstatus is False:
        try:
            db.create_all()
        except Exception:
            time.sleep(2)
        else:
            dbstatus = True
    database_initialization_sequence()
    app.run(debug=True, host='0.0.0.0')
