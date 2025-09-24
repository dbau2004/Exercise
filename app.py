from flask import Flask, jsonify, render_template

app = Flask(__name__)

# API check tình trạng server
@app.get('/health')
def health():
    return 'OK', 200

# API trả về JSON
@app.get('/api')
def hello_api():
    return jsonify(msg='Hello from Flask API!')

# Trang giao diện chính (HTML)
@app.get('/')
def index():
    return render_template('index.html')

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000, debug=True)
