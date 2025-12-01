from flask import Flask 
app=Flask(__name__)

@app.route("/home")

def home():
    return "Hello world, I'm from the home path"

@app.route("/app")

def appl():
    return "Hi all this is from app path"

if __name__ == "__main__":
    app.run(debug=True)
    
        