from flask_sqlalchemy import SQLAlchemy

from flask_restplus import Api
# from flask_marshmallow import Marshmallow

db = SQLAlchemy()
api = Api(
    title='Shorty Api',
    version='1.0',
    description='shorty api is a url shorter api using bit.ly and a local shortener api',
)
