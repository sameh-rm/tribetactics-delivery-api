import datetime
from flask import abort
from re import I
import jwt
from jwt.exceptions import DecodeError
import requests.exceptions
from requests.models import PreparedRequest
from functools import wraps
from flask import request
import json
from project.app.users.models import User
from project.app.settings import RECORDS_PER_PAGE, SECRET_KEY

algorithm = "HS256"


def validate_url(url):
    prepared_request = PreparedRequest()
    try:
        prepared_request.prepare_url(url, None)
        return True
    except requests.exceptions.MissingSchema as e:
        return False


def generate_token(user: User, exp_hours: int = 12):
    return jwt.encode({"user": user.username, "exp": datetime.datetime.utcnow(
    ) + datetime.timedelta(hours=exp_hours)}, SECRET_KEY, algorithm=algorithm)


def decode_token(token):
    return jwt.decode(token.split(" ")[1], SECRET_KEY, algorithms=[algorithm])


class AuthError(Exception):
    def __init__(self, error, status_code):
        self.error = error
        self.status_code = status_code


def get_token_auth_header():
    """Obtains the Access Token from the Authorization Header
    """
    auth = request.headers.get('Authorization', None)
    if not auth:
        raise AuthError({
            'code': 'authorization_header_missing',
            'description': 'Authorization header is expected.'
        }, 401)

    parts = auth.split()
    if parts[0].lower() != 'bearer':
        raise AuthError({
            'code': 'invalid_header',
            'description': 'Authorization header must start with "Bearer".'
        }, 401)

    elif len(parts) == 1:
        raise AuthError({
            'code': 'invalid_header',
            'description': 'Token not found.'
        }, 401)

    elif len(parts) > 2:
        raise AuthError({
            'code': 'invalid_header',
            'description': 'Authorization header must be bearer token.'
        }, 401)

    token = parts[1]
    return token


def check_permissions(permissions, user):

    if user.role.title == "ADMIN":
        return True
    if not all(perm in user.role.permissions for perm in permissions):
        abort(403, "You are not allowed to perform this action!")
    return True


def auth_required(permissions=""):
    def token_required(f):
        @wraps(f)
        def decorated(*args, **kwargs):
            try:
                # expected (Bearer Token)
                decoded_token = jwt.decode(get_token_auth_header(),
                                           SECRET_KEY, algorithms=[algorithm])
                user = User.query.filter(
                    User.username == decoded_token["user"]).one_or_none()
                check_permissions(permissions, user)
                return f(logged_user=user, *args, **kwargs)
            except DecodeError as e:
                return {"message": "Token is invalid or expired", "success": False}, 403
        return decorated
    return token_required


def paginate(query):
    page = request.args.get("page", 1, type=int)
    q = query.limit(RECORDS_PER_PAGE).offset(
        (page - 1) * RECORDS_PER_PAGE).all()
    formated_data = [record.format() for record in q]
    return formated_data
