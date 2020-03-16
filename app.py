from flask import Flask, render_template, request, jsonify

app = Flask(__name__)

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/Senti')
def Senti():
    text = request.form['note-textare']
    return jsonify({'text' })
    
if __name__=="__main__":
    app.debug = True
    app.run()