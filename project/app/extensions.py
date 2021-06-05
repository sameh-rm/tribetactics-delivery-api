from flask_sqlalchemy import SQLAlchemy

from flask_restplus import Api
# from flask_marshmallow import Marshmallow

db = SQLAlchemy()
api = Api(
    title='Tribtactics Api',
    version='1.0',
    description='Tribetactics Delivery API',
)
