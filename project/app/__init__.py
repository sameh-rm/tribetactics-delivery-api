from project.app.orders.models import Order
from project.app.resturants.models import Resturant
from project.app.users.models import User
from werkzeug.exceptions import HTTPException
from flask_migrate import Migrate
from flask import (
    Flask,  request, abort, redirect
)
from flask_cors import CORS
from .users.api import api as users_ns
from .extensions import (
    db,
    api
)


def create_app(db_uri=None, config_file="settings.py"):
    app = Flask(__name__)
    app.config.from_pyfile(config_file)
    CORS(app, resources={r"/*": {"origins": "*"}})

    # INIT Extensions
    if db_uri:
        # use a custom uri
        app.config["SQLALCHEMY_DATABASE_URI"] = db_uri
        # use the default MONGO_URI from settings.py
    db.app = app
    db.init_app(app)

    migrate = Migrate(app, db)
    api.init_app(app)

    api.add_namespace(users_ns, "/api/users")

    # error Handler
    @app.route("/")
    def index():
        return "works"
    # adding cors headers

    @app.after_request
    def after_request(response):
        response.headers.add(
            "Access-Control-Allow-Headers",
            "Content-Type,Authorization,true"
        )
        response.headers.add(
            "Access-Control-Allow-Methods",
            "GET,POST,PUT,PATCH,DELETE,OPTIONS"
        )
        return response

    @app.errorhandler(HTTPException)
    def handle_bad_request(e):
        return {
            "message": e.description,
            "code": e.code
        }, e.code

    return app
