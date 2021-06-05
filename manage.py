import os

from flask_migrate import Migrate
from project.app.settings import DEBUG
import unittest

from flask_script import Manager

from project.app import create_app, db

app = create_app()

app.app_context().push()

manager = Manager(app)

migrate = Migrate(app, db)


@manager.command
def run():
    app.run(host="0.0.0.0", debug=DEBUG, port=5000)


@manager.command
def test():
    """Runs the unit tests."""
    tests = unittest.TestLoader().discover('app/test', pattern='test*.py')
    result = unittest.TextTestRunner(verbosity=2).run(tests)
    if result.wasSuccessful():
        return 0
    return 1


if __name__ == '__main__':
    manager.run()
