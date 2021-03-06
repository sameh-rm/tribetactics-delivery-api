<p align="center">
  <a href="" rel="noopener">
 <img width=330px height=200px src="https://upload.wikimedia.org/wikipedia/commons/thumb/3/3c/Flask_logo.svg/1200px-Flask_logo.svg.png" alt="Project logo"></a>
</p>

<h3 align="center"> Flask App</h3>

<div align="center">

[![License](https://img.shields.io/badge/license-MIT-blue.svg)](/LICENSE)

</div>

---

<p align="center"> Flask App BoilerPlate.
    <br> 
</p>

## ð Table of Contents

- [Getting Started](#getting_started)
- [Usage](/backend)
- [Built Using](#built_using)
- [Authors](#authors)
- [Acknowledgments](#acknowledgement)

## ð Getting Started <a name = "getting_started"></a>

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites

You need **[Python 3.7](https://www.python.org/downloads/release/python-377/)** installed.

- Clone the repo

  ```
  git clone https://github.com/sameh-rm/flask-boilerplate
  ```

- your dotenv file must contain

  ```bash
    DB_URI
    SECRET_KEY
  ```

### Installing

##### &nbsp;&nbsp;Backend

- create virtual env:
  To create a virtual environment, decide upon a directory where you want to place it, and run the venv module as a script with the directory path:

  ```
  python -m venv env
  ```

* Once youâve created a virtual environment, you may activate it
  - On Windows, run:
    ```cmd
    env\Scripts\activate.bat
    ```
  - On Unix or MacOS, run:
    ```bash
    source env/bin/activate
    ```
* installing packages:
  ```bash
  pip install -r requirements.txt
  ```

- testing the project

  ```bash
  python manage.py test
  ```

- starting the project

  ```bash
  python manage.py run
  ```

## âï¸ Built Using <a name = "built_using"></a>

- [FLASK RESTPLUS](https://flask-restplus.readthedocs.io/en/stable/index.html) - Flask Rest Plus framework
- [FLASK](https://flask.palletsprojects.com/en/2.0.x/) - Python Web Framework
- [Python](https://www.python.org/) - Python 3.7

## âï¸ Authors <a name = "authors"></a>

- [@samerh-rm](https://github.com/sameh-rm) - Initial work

## ð Acknowledgements <a name = "acknowledgement"></a>

- Hat tip to anyone whose code was used
- Inspiration
- References
