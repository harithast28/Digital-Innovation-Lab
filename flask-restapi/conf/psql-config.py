import os

# local testing
# db_name = "postgres"
# db_host = "192.168.99.100"
# db_port = "5432"
# db_user = "postgres"
# user_password = "password"

db_name = "postgres"
db_host = "localhost"
db_port = "5432"
db_user = "postgres"
user_password = "password"

SQLALCHEMY_TRACK_MODIFICATIONS = True
SQLALCHEMY_DATABASE_URI = 'postgresql://' + db_user + ':' + user_password + '@' + db_host + '/' + db_name
