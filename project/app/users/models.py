from project.app.extensions import db
from sqlalchemy import Column, String, Integer


class User(db.Model):
    id = Column(Integer, primary_key=True)
    username = Column(String, unique=True, nullable=False)
    name = Column(String, nullable=False)
    email = Column(String, unique=True, nullable=False)
    password = Column(String, nullable=False)
    role_id = Column(Integer, db.ForeignKey("role.id"), nullable=False)
    role = db.relationship(
        "Role", uselist=False, back_populates="user",)
    foodMenu = db.relationship(
        "FoodMenu", uselist=False, back_populates="user",)

    def __init__(self, name, email, username, password, role_id):
        self.name = name
        self.email = email
        self.username = username
        self.password = password
        self.role_id = role_id

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
            'name': self.name,
            'username': self.username,
            'email': self.email,
            'role_id': self.role.id,
            'role_title': self.role.title,
        }

    def __repr__(self):
        return '<User %r>' % self.name


@db.event.listens_for(User, "after_insert")
def after_insert(mapper, connection, target):
    pass


class Role(db.Model):
    id = Column(Integer, primary_key=True)
    title = Column(String, unique=True, nullable=False)
    users = db.relationship('User',
                            backref=db.backref('role', lazy=True))

    def __init__(self, title):
        self.title = title

    def insert(self):
        db.session.add(self)
        db.session.commit()

    def update(self):
        db.session.add(self)
        db.session.commit()

    def delete(self):
        db.session.delete(self)
        db.session.commit()

    def format(self, with_users):
        formated_role = {
            'id': self.id,
            'title': self.title,
        }
        if with_users:
            formated_role["users"] = [user.format() for user in self.users]

        return formated_role

    def __repr__(self):
        return '<Role %r>' % self.name


class Permission(db.Model):
    id = Column(Integer, primary_key=True)
    # can-create:user
    # can-update:user
    # can-read:user
    # can-delete:user
    title = Column(String, unique=True, nullable=False)

    def __init__(self, title):
        self.title = title

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
        }

    def __repr__(self):
        return '<Permission %r>' % self.name


class RolePermissions(db.Model):

    id = Column(Integer, primary_key=True)
    role_id = Column(Integer, db.ForeignKey("role.id"), nullable=False)
    role = db.relationship('Role',
                           backref=db.backref('permissions', lazy=True))
    permission_id = Column(Integer, db.ForeignKey(
        "permission.id"), nullable=False)
    permission = db.relationship('Permission',
                                 backref=db.backref('permissions', lazy=True))

    def __init__(self, role, permission):
        self.role = role
        self.permission = permission

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
            'role': self.role.title,
            'permission': self.permission.title,
        }

    def __repr__(self):
        return '<Role %r Permission %r>' % self.role.title, self.permission.title
