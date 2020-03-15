
from flask import render_template
 
@app.route('/Index')
def signUp():
    return render_template('index.html')
