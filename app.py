"""
Main application module.
Use it to serve as docker container entry point.
"""

from json import loads

from flask import Flask, request, jsonify

app = Flask(__name__)


@app.route('/', methods=["GET"])
def hello_world():
    """
    ./ - root endpoint with get method
    describe methods specific to your application here
    :return:
    """
    return 'use "/predict" for prediction with .json application'


@app.route('/predict', methods=["POST"])
def predict():
    """
    Predicts with model based on application content
    :return:
    """
    inp_dct = loads(request.data)
    print(inp_dct)
    return jsonify({"response": list(range(9))})


if __name__ == '__main__':
    app.run(port=80, host="0.0.0.0")
