from app import db, users

db.create_all()


test_rec = users(
        'Gayathri  P M',
        'g3@gmail.com'
        )


db.session.add(test_rec)
db.session.commit()
