# from flask import Flask, jsonify
# from sqlalchemy import desc
# from sqlalchemy.orm.exc import NoResultFound
# from db.models import db, Meta, Sensordata, meta_schema, metas_schema, sensordatas_schema
#
# app = Flask(__name__)
# app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
#
# app.config.from_pyfile('conf/psql-config.py')
# db.init_app(app)
#
# 
# @app.before_first_request
# def create_database():
#     print("\n\n\n..........CREATING DB")
#     db.create_all()
#
#
# # @app.route('/api/v1/user_login/', methods=['POST'])
# # def login():
# #     print("\n\n\n ATTEMPT LOGIN 1")
# #     return None
# #
# #
# # @app.route('/api/v1/sensors/', methods=['GET'])
# # def get_all_sensors():
# #     s = Meta.query.all()
# #     # serialize the queryset
# #     result = metas_schema.dump(s)
# #     return jsonify({'sensors': result.data})
# #
# #
# # @app.route('/api/v1/sensors/<int:id>', methods=['GET'])
# # def get_sensor(id):
# #     try:
# #         # m = Meta.query.get(id)
# #         # in order to fetch NoResultFound exception it is neccessary to query the primary key as follows:
# #         m = Meta.query.filter_by(sid=id).one()
# #         meta_result = meta_schema.dump(m)
# #         return jsonify({'sensors': meta_result.data})
# #     except NoResultFound:
# #         return jsonify({"message": "Sensor could not be found."}), 400
# #
# #
# # @app.route('/api/v1/sensors/<int:id>/data/', methods=['GET'])
# # def get_all_data_sensor(id):
# #     try:
# #         m = Meta.query.filter_by(sid=id).one()
# #         meta_result = meta_schema.dump(m)
# #         sensor_result = sensordatas_schema.dump(m.sensordata.all())
# #         return jsonify({'sensors': meta_result.data, 'data': sensor_result.data})
# #     except NoResultFound:
# #         return jsonify({"message": "Sensor could not be found."}), 400
# #
# # # to be implemented
# # # @app.route("/api/v1/sensors/data/latest")
# # # def get_latest_data_all_sensors():
# #
# #
# # @app.route("/api/v1/sensors/<int:id>/data/latest", methods=['GET'])
# # def get_latest_data_sensor(id):
# #     try:
# #         m = Meta.query.filter_by(sid=id).one()
# #         meta_result = meta_schema.dump(m)
# #         # query the latest unix_epoch for this <id>
# #         # order_by: unix_epoch descending
# #         # with_entities: only return column unix_epoch
# #         # first(): only get first entry
# #         qry = Sensordata.query.filter_by(sid=id).order_by(desc('unix_epoch')).with_entities('unix_epoch').first()
# #         # convert this entry into a scalar representation that can be used for filtering
# #         max = db.session.query(db.func.max(qry)).scalar()
# #         sensor_result = sensordatas_schema.dump(m.sensordata.filter_by(unix_epoch=max))
# #         return jsonify({'sensors': meta_result.data, 'data': sensor_result.data})
# #     except NoResultFound:
# #         return jsonify({"message": "Sensor could not be found."}), 400
#
#
# if __name__ == '__main__':
#     try:
#         app.run(debug=True, host='localhost', port=8080)
#     except Exception as E:
#         print("\n\n\n Binding not happening", E)
