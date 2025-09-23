from flask import Flask, jsonify
app = Flask(__name__)


@app.get('/health')
def health():
	return 'OK', 200


@app.get('/')
def hello():
	return jsonify(msg='Hello from Flask!')


if __name__ == '__main__':
	app.run(host='0.0.0.0', port=5000)