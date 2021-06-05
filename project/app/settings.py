import os
from os import getenv
from re import DEBUG
from string import ascii_letters, digits
from dotenv import load_dotenv
DEBUG = True

load_dotenv()


SQLALCHEMY_DATABASE_URI = getenv("DB_URI")
SECRET_KEY = getenv("SECRET_KEY")
SQLALCHEMY_TRACK_MODIFICATIONS = True
