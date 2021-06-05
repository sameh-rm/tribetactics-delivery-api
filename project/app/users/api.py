
from flask import abort
from flask.globals import request
from flask_restplus import Resource, fields, Namespace
from project.app.extensions import db


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
                               'email': fields.String("Joe@mail.com"),
                               'username': fields.String("Joe"),
                               'password': fields.String("password"),
                           })

login_model = api.model("Login",
                        {
                            'username': fields.String("Joe"),
                            'password': fields.String("password"),
                        })

user_url = api.model("AddUserURl", {
    "to_url": fields.Url("https://www.google.com/")
})

responses = {
    200: "Success",
    400: "username and password are required to login",
    404: "login failed check your username and password and try again",
    422: "invalid password"
}


# @api.route("/login", methods=["POST"])
# class Login(Resource):
#     @api.expect(login_model)
#     @api.doc(responses=responses)
#     def post(self):
#         try:
#             body = api.payload
#             username = body["username"]
#             password = body["password"]
#             if not username or not password:
#                 abort(400, "username and password are required to login")

#             # check if the sent username is an existed username or email
#             user_exists = mongo.db.users.find_one(
#                 {"$or": [{"username": username}, {"email": username}]})

#             if user_exists:
#                 user = User.from_doc(user_exists)
#             else:
#                 abort(404, "login failed check your username and password and try again")

#             if check_password_hash(user.password, password):
#                 token = generate_token(user)
#                 return {"token": token,
#                         "username": username}, 200
#             else:
#                 abort(422, "invalid password")
#         except KeyError:
#             abort(400, "username and password are required to login")
