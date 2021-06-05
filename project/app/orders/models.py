import datetime
from sqlalchemy import String, Integer, Column, Boolean, DateTime
from sqlalchemy.sql.sqltypes import Float
from project.app.extensions import db


class Order(db.Model):
    __tablename__ = "orders"
    id = Column(Integer, primary_key=True)
    orderedAt = Column(DateTime, nullable=False,
                       default=datetime.datetime.utcnow())
    deliveredAt = Column(String, nullable=True)
    total = Column(Float,  nullable=False, default=0)
    paymentMethod = Column(String,
                           nullable=False, default="Paypal")
    status = Column(Boolean,  nullable=False, default=False)
    user = db.relationship('User',
                           backref=db.backref('orders', lazy=True))

    shippingInfo_id = Column(Integer, db.ForeignKey(
        "shippinginfo.id"), nullable=False)
    shippingInfo = db.relationship(
        "ShippingInfo", uselist=False, back_populates="orders",)
    shippingCost = Column(Float,
                          nullable=False, default=0)

    def __init__(self, total,
                 paymentMethod,
                 user,
                 shippingInfo):
        self.total = total
        self.paymentMethod = paymentMethod
        self.user = user
        self.shippingInfo = shippingInfo

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
            'orderedAt': self.orderedAt,
            'deliveredAt': self.deliveredAt,
            'total': self.total,
            'paymentMethod': self.paymentMethod,
            'status': self.status,
            'user': self.user.username,
        }


class ShippingInfo(db.Model):
    __tablename__ = "shippinginfo"
    id = Column(Integer, primary_key=True)
    address = Column(String, nullable=False,)
    city = Column(String, nullable=True)
    orders = db.relationship('Order',
                             backref=db.backref('shippinginfo', lazy=True))

    def __init__(self, city, address,):
        self.address = address
        self.city = city

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
            'orderedAt': self.address,
            'deliveredAt': self.city,
        }


class OrderItem(db.Model):
    __tablename__ = "orderitems"
    id = Column(Integer, primary_key=True)
    foodItemName = Column(String, nullable=False)
    unitPrice = Column(Float, nullable=False, default=0)
    subTotal = Column(Float,  nullable=False, default=0)
    qty = Column(Integer,  nullable=False, default=0)
    fooditem_id = Column(Integer, db.ForeignKey("fooditem.id"), nullable=False)
    fooditem = db.relationship('FoodItem',
                               backref=db.backref('orderItems', lazy=True))
    order_id = Column(Integer, db.ForeignKey(
        "orders.id"), nullable=False)
    order = db.relationship('Order',
                            backref=db.backref('orderItems', lazy=True))

    def __init__(self, foodItemName,
                 unitPrice,
                 subTotal,
                 qty, fooditem_id, order_id):
        self.foodItemName = foodItemName
        self.unitPrice = unitPrice
        self.subTotal = subTotal
        self.qty = qty
        self.fooditem_id = fooditem_id
        self.order_id = order_id

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
            'foodItemName': self.foodItemName,
            'unitPrice': self.unitPrice,
            'subTotal': self.subTotal,
            'qty': self.qty,
            'fooditem_id': self.fooditem_id,
            'order_id': self.order_id,
        }
