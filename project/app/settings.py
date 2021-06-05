import os
from os import getenv
from re import DEBUG
from string import ascii_letters, digits
from dotenv import load_dotenv
DEBUG = True

load_dotenv()

uri = "postgresql://{}:{}@{}/{}".format(
    'postgres', 'postgres', 'localhost:5432', "tribetactics")
# SQLALCHEMY_DATABASE_URI = getenv("DB_URI")
SQLALCHEMY_DATABASE_URI = uri
SECRET_KEY = getenv("SECRET_KEY")
SQLALCHEMY_TRACK_MODIFICATIONS = True
RECORDS_PER_PAGE = 10
