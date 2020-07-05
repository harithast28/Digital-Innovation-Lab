# from app import db
#
#
# # MODELS
# class Restaurants(db.Model):
#
#     __tablename__ = 'restaurants'
#
#     id = db.Column(db.Integer, primary_key=True)
#     name = db.Column(db.String(100))
#     address = db.Column(db.String(50))
#     rating = db.Column(db.Integer(), default=0)
#
#     def __init__(self, name, address, rating, id):
#         self.id = id
#         self.name = name
#         self.address = address
#         self.rating = rating
#
#     @classmethod
#     def save(self):
#         """
#         Save a model instance.
#         :return: Model instance
#         """
#
#         print("\n\n\n inside save")
#
#         db.session.add(self)
#         db.session.commit()
#
#         return self
#
#
# class Orders(db.Model):
#     id = db.Column('order_id', db.Integer, primary_key=True)
#     total_amount = db.Column(db.Float())
#
#     # users = db.Column(db.Integer, db.ForeignKey('users.id', onupdate='CASCADE', ondelete='CASCADE'), index=True)
#     # restaurant = db.Column(db.Integer, db.ForeignKey('users.id', onupdate='CASCADE', ondelete='CASCADE'), index=True)
#
#     def __init__(self, id, total_amount, users, restaurant):
#         self.id = id
#         self.total_amount = total_amount
#         # self.users = users
#         # self.restaurant = restaurant
#
#
# class Users(db.Model):
#
#     __tablename__ = 'users'
#
#     id = db.Column(db.Integer, primary_key=True)
#     name = db.Column(db.String(100))
#     username = db.Column(db.String(100))
#     email = db.Column(db.String(50))
#     password = db.Column(db.String(100))
#
#     # orders = db.relationship(Orders, backref='orders')
#     # restaturant = db.relationship(Restaurants, backref='restaurants')
#
#     def __init__(self, name, email, password, username, id):
#         self.id = id
#         self.name = name
#         self.email = email
#         self.password = password
#         self.username = username
#
#     @classmethod
#     def save(self):
#         """
#         Save a model instance.
#         :return: Model instance
#         """
#
#         print("\n\n\n inside save")
#
#         db.session.add(self)
#         db.session.commit()
#
#         return self
