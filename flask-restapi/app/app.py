import time
import os
import json
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


# Json Model for results
class JsonModel(object):

    def as_dict(self):
        return {c.name: getattr(self, c.name) for c in self.__table__.columns}


# # MODELS
class Restaurants(db.Model, JsonModel):

    __tablename__ = 'restaurants'

    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(100))
    address = db.Column(db.String(50))
    rating = db.Column(db.Integer(), default=0)
    zone = db.Column(db.String(20))
    crowd_intensity = db.Column(db.Integer(), default=0)

    def __init__(self, name, address, rating, id, zone, crowd_intensity):
        self.id = id
        self.name = name
        self.address = address
        self.rating = rating
        self.zone = zone
        self.crowd_intensity = crowd_intensity

    @classmethod
    def save(self):
        """
        Save a model instance.
        :return: Model instance
        """

        db.session.add(self)
        db.session.commit()

        return self


class Orders(db.Model):
    id = db.Column('order_id', db.Integer, primary_key=True)
    total_amount = db.Column(db.Float())

    def __init__(self, id, total_amount, users, restaurant):
        self.id = id
        self.total_amount = total_amount


class Users(db.Model):

    __tablename__ = 'users'

    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(100))
    username = db.Column(db.String(100))
    email = db.Column(db.String(50))
    password = db.Column(db.String(100))

    def __init__(self, name, email, password, username, id):
        self.id = id
        self.name = name
        self.email = email
        self.password = password
        self.username = username


class Sensors(db.Model):

    __tablename__ = 'sensors'

    id = db.Column(db.Integer, primary_key=True)
    timestamp = db.Column(db.String())
    zone = db.Column(db.String(20))
    sensor_count = db.Column(db.Integer())
    crowd_count = db.Column(db.Integer())

    def __init__(self, timestamp, zone, sensor_count, crowd_count, id):
        self.id = id
        self.timestamp = timestamp
        self.zone = zone
        self.sensor_count = sensor_count
        self.crowd_count = crowd_count


# LOAD DATABASE
def load_json(filename):
    FILEPATH = os.path.join('datalakes',  'json')
    with open(os.path.join(FILEPATH, filename), "r") as json_file:
        return json.load(json_file)

    return None


def database_initialization_sequence():
    db.drop_all()
    db.create_all()

    """
        Initiating the database with default values here
    """

    users_data = []
    users = load_json(filename='users.json')

    for user in users:
        users_data.append(user)

    for d in users_data:

        user = Users(name=d['name'],  username=d['username'],  email=d['email'], password=d['password'], id=d['id'])
        db.session.add(user)
        db.session.commit()

    restaurants_data = []
    restaurants = load_json(filename='restaurants.json')

    for restaurant in restaurants:
        restaurants_data.append(restaurant)

    for d in restaurants_data:
        restaurant = Restaurants(id=d['id'], name=d['name'], address=d['address'], rating=d['rating'], zone=d['zone'], crowd_intensity=d['crowd_intensity'])
        db.session.add(restaurant)
        db.session.commit()

    sensor_data = []
    sensors = load_json(filename='sensors.json')

    for sensor in sensors:
        sensor_data.append(sensor)

    for d in sensor_data:
        sensor = Sensors(id=d['id'], zone=d['zone'], timestamp=d['timestamp'], sensor_count=d['sensor_count'], crowd_count=d['crowd_count'])
        db.session.add(sensor)
        db.session.commit()


# Test function
@app.route('/', methods=['GET', 'POST'])
def home():
    value = Users('me', 'meg', 'me@gmail.com', 'devpassword', 2)
    db.session.add(value)
    db.session.commit

    answer = db.session.query(Users).all()

    return jsonify({"message": answer[0].email}), 200

# Test Login
@app.route('/login/', methods=['GET', 'POST'])
def login():

    response = {
        'message': ' Please Enter the data'
    }
    code = 422

    if request.method == 'POST':

        username = request.args.get('username')
        password = request.args.get('password')

        if username is not None and password is not None:
            result = db.session.query(Users).filter(Users.username == username, Users.password == password).first()
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

    return jsonify(response), code


def calculate_crowd_intensity(restaurants):

    # TODO:

    # Upon sending the data, try to write a function that sends the crowd intensity based on that time.
    # Take  time.now() compare to dataset, compare zone to zone where restaurant is
    # Take average of sensor count and crowd count
    # Send that  avergae ka  percentage as crowd_intensity

    # time = "22-03-2020 12:00:00"
    # zone = 'B'
    intensity = 0

    print("\n\n\n INSIDE CROWD INTENSITY FUNCTION", restaurants)

    for rest in restaurants:

        print("\n\n\n\n\n RESTAURANT.........", rest.zone)

        if rest.zone == 'A':
            # Should improve based on Time also
            data = db.session.query(Sensors).filter(Sensors.zone == 'A').all()
            for d in data:
                intensity = intensity + int(d.crowd_count)
        elif rest.zone == 'B':
            data = db.session.query(Sensors).filter(Sensors.zone == 'B').all()
            for d in data:
                intensity = intensity + int(d.crowd_count)
        else:
            intensity = 0

        rest.crowd_intensity = intensity/len(data) * 100

    return restaurants

# Returning the list of restauransts available
@app.route('/restaurants/', methods=['GET'])
def restaurants():

    if request.method == 'GET':

        restaurants = db.session.query(Restaurants).all()

        print("\n\n\n Restaurants", restaurants)

        if restaurants and len(restaurants) > 0:

            response = {
                'data': json.dumps([u.as_dict() for u in restaurants])
            }

            print("\n\n\n........................................")

            data = calculate_crowd_intensity(restaurants)

            #print("\n\n\n  DATA", data)
            print("\n\n\n  DATA", json.dumps([u.as_dict() for u in data]))

            code = 200
        else:
            response = {
                'message':  'There are no restaurants available'
            }
            code = 404

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
