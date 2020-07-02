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

    def __init__(self, name, email):
        self.name = name
        self.email = email


def database_initialization_sequence():
    db.create_all()
    test_rec = users(
            'Haritha Harikumar',
            'haritha@gmail.com ')

    db.session.add(test_rec)
    db.session.rollback()
    db.session.commit()


@app.route('/', methods=['GET', 'POST'])
def home():
    print("\n\n  TESTING HOME.............................. ")

    value = users('ME', 'me@gmail.com')
    db.session.add(value)
    db.session.commit

    answer = db.session.query(users).all()

    print("\n\n\n value", answer)
    return jsonify({"message": answer[0].email}), 200


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
