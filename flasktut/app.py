from flask import Flask
import datetime

app = Flask( __name__ )

@app.route( '/' )
def hello():
    return f'Hello, World! ({datetime.datetime.now()})'

if __name__ == '__main__':
    app.run()
