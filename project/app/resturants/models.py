
from sqlalchemy import Column, Integer, String, Float
from project.app.extensions import db


class Resturant(db.Model):
    id = Column(Integer, primary_key=True)
    title = Column(String, unique=True, nullable=False)
    description = Column(String,  nullable=False)
    brand = Column(String, nullable=False)
    phone = Column(String,  nullable=False)
    email = Column(String, nullable=False)
    user = db.relationship('User',
                           backref=db.backref('resturant', lazy=True))
    foodMenu = db.relationship(
        "FoodMenu", uselist=False, backref=db.backref('resturant', lazy=True))
    user_id = Column(Integer, db.ForeignKey("user.id"), nullable=False)

    def __init__(self, title, description, brand,  user, menuTitle="", menuDescription=""):
        self.title = title
        self.description = description
        self.brand = brand
        self.user = user
        self.foodMenu = FoodMenu(
            menuTitle or title,  menuDescription or description, self)

    def insert(self):
        db.session.add(self)
        db.session.commit()

    def update(self):
        db.session.add(self)
        db.session.commit()

    def delete(self):
        db.session.delete(self)
        db.session.commit()

    def format(self):
        return {
            'id': self.id,
            'title': self.title,
            'description': self.description,
            'brand': self.brand,
            'user': self.user.username,
            'menuTitle': self.foodMenu.title,
        }

    def __repr__(self):
        return '<User %r>' % self.name


class FoodMenu(db.Model):
    __tablename__ = "foodMenu"
    id = Column(Integer, primary_key=True)
    title = Column(String, nullable=False)
    description = Column(String, nullable=False)
    resturant_id = Column(Integer, db.ForeignKey(
        "resturant.id"), nullable=False)

    items = db.relationship('FoodItem',
                            backref=db.backref('menu', lazy=True))

    def __init__(self, title, description, resturant_id):
        self.title = title
        self.description = description
        self.resturant_id = resturant_id

    def insert(self):
        db.session.add(self)
        db.session.commit()

    def update(self):
        db.session.add(self)
        db.session.commit()

    def delete(self):
        db.session.delete(self)
        db.session.commit()

    def format(self):
        return {
            'id': self.id,
            'title': self.title,
            'description': self.description,
            'resturant': self.resturant,
        }

    def __repr__(self):
        return '<Restaurant %r Menu %r>' % self.resturant.title, self.title


class FoodItem(db.Model):
    __tablename__ = "fooditem"
    id = Column(Integer, primary_key=True)
    name = Column(String, nullable=False)
    price = Column(Float, nullable=False, default=0)
    menu_id = Column(Integer, db.ForeignKey("foodMenu.id"), nullable=False)

    def __init__(self, title, description, resturant):
        self.title = title
        self.description = description
        self.resturant = resturant

    def insert(self):
        db.session.add(self)
        db.session.commit()

    def update(self):
        db.session.add(self)
        db.session.commit()

    def delete(self):
        db.session.delete(self)
        db.session.commit()

    def format(self):
        return {
            'id': self.id,
            'title': self.title,
            'description': self.description,
            'menu': self.menu.title,
        }

    def __repr__(self):
        return '<item %r Menu %r>' % self.name, self.menu.title
