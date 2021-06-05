import os
from os import getenv
from re import DEBUG
from string import ascii_letters, digits
from dotenv import load_dotenv

load_dotenv()


DB_URI = getenv("DB_URI")
SECRET_KEY = getenv("SECRET_KEY")


DEBUG = True
