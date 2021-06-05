
from sqlalchemy import or_
from sqlalchemy.exc import IntegrityError
from werkzeug.security import generate_password_hash
from project.app.users.models import User
from flask import abort, jsonify
from flask.globals import request
from flask_restplus import Resource, fields, Namespace
from werkzeug import check_password_hash
from project.app.extensions import db
from project.app.utils import auth_required, generate_token, paginate
from email_validator import validate_email, EmailNotValidError

algorithm = 'sha256'
authorizations = {
    'authorization': {
        'type': 'apiKey',
        'in': 'header',
        'name': 'authorization',
        "description": "Bearer {Token}"
    }
}
api = Namespace("users", description="users related operations",
                authorizations=authorizations)

register_model = api.model("Register",
                           {
                               'name': fields.String(default="Joe Doe"),
                               'email': fields.String(default="Joe@mail.com"),
                               'username': fields.String(default="Joe"),
                               'password': fields.String(default="password"),
                               'role_id': fields.Integer(default=1),
                           })

login_model = api.model("Login",
                        {
                            'username': fields.String(default="Joe"),
                            'password': fields.String(default="password"),
                        })


@api.route("/", methods=["GET", "POST"])
class UserGP(Resource):
    @api.expect(register_model)
    @api.doc(responses={
        201: "User Created",
        400: "Invalid Data Format",
        409: "Conflict Username or Email already in use",
        422: "invalid Email or Role ID is Invalid"
    })
    def post(self):
        try:
            data = api.payload

            existed = User.query.filter(
                or_(User.username == data["username"], User.email == data["email"])).one_or_none()

            if existed:
                abort(409, "Conflict Username or Email already in use")
            if validate_email(data["email"]):
                created_user = User(
                    name=data["name"],
                    email=data["email"],
                    username=data["username"],
                    role_id=data["role_id"],
                    password=generate_password_hash(
                        data["password"], method=algorithm)
                )
                created_user.insert()
                token = generate_token(created_user)
                return {"token": token,
                        "username": created_user.username}, 201
        except KeyError:
            abort(400, "username and password are required to login")
        except EmailNotValidError:
            abort(422, "invalid Email")
        except IntegrityError:
            abort(422, "Role ID is Invalid")

    @api.doc(responses={
        200: "User Created",
        401: "Token is missing",
        403: "Token is invalid or expired",

    })
    @api.doc(security="authorization",)
    @auth_required(permissions=["can-getall:user"])
    def get(self):
        return paginate(User.query)

# GET / DELETE / UPDATE


@api.route("/<int:id>", methods=["GET", "DELETE", "PUT"])
class UserGPD(Resource):
    @api.doc(security="authorization", params={'id': 'user_id'})
    @auth_required(permissions=["can-get:user"])
    def get(self, logged_user, id):
        if logged_user.role.title == "ADMIN" or logged_user.id == id:
            return User.query.get(id).format()
        abort(401, "UNAUTHORIZED")

    @api.doc(security="authorization", responses={
        200: "Success",
        401: "UNAUTHORIZED",
        403: "Token is invalid or expired",

    }, params={'id': 'user_id'})
    @auth_required(permissions=["can-update:user"])
    def put(self, logged_user, id):
        if logged_user.role.title != "ADMIN" and logged_user.id != id:
            abort(401, "UNAUTHORIZED")
        user = User.query.get_or_404(id)
        data = api.payload
        for key in data.keys():
            if not key == "password":
                setattr(user, key, data[key])
            else:
                setattr(user, key, generate_password_hash(
                    data[key], method=algorithm))
        user.update()

    @api.doc(security="authorization", responses={
        200: "Success",
        401: "UNAUTHORIZED",
        403: "Token is invalid or expired",

    }, params={'id': 'user_id'})
    @auth_required(permissions=["can-delete:user"])
    def delete(self, logged_user, id):
        if logged_user.role.title == "ADMIN":
            user = User.query.get_or_404(id)
            user.delete()
        else:
            abort(401, "UNAUTHORIZED")


@api.route("/login", methods=["POST"])
class Login(Resource):
    @api.expect(login_model,)
    @api.doc(
        responses={
            200: "Success",
            400: "login requires Username and Password",
            404: "Invalid Credentials, Not Found",
            422: "invalid Password"
        })
    def post(self):
        try:
            body = api.payload
            username = body["username"]
            password = body["password"]
            if not username or not password:
                abort(400, "login requires Username and Password")

            # check if the sent username is an existed username or email
            user = User.query.filter(
                or_(User.username == username, User.email == username)).one_or_none()

            if not user:
                abort(404, "Invalid Credentials, Not Found")

            if check_password_hash(user.password, password):
                token = generate_token(user)
                return {"token": token,
                        "username": username}, 200
            else:
                abort(422, "Invalid Password")
        except KeyError:
            abort(400, "username and password are required to login")
