# app.py

from flask import Flask, request, json


app = Flask(__name__)


@app.route("/")
def default():
    return "Welcome to serverless flask sample?"


@app.route('/data')
def data():
    # here we want to get the value of user (i.e. ?user=some-value)
    data = {'user': 'user not found'}
    user = request.args.get('user', None)
    if user:
        data.update({'user': f'welcome {user} to flask world'})

    return app.response_class(
        response=json.dumps(data),
        status=200,
        mimetype='application/json'
    )
