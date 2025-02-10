from flask import Flask

app = Flask(__name__)

@app.route('/')
def hello_world():
    return '''
    <html>
        <body>
            <h1>Basic Details</h1>
            <p>Name: John Doe</p>
            <p>Occupation: Developer</p>
            <p>Location: Somewhere on Earth</p>
            <p>Hobbies: Coding, Reading, Gaming</p>
        </body>
    </html>
    '''

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
