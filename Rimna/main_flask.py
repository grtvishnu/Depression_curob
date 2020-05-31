import json
import pandas as pd
import numpy as np
from sklearn.model_selection import train_test_split
from sklearn.linear_model import LogisticRegression
from sklearn.ensemble import RandomForestClassifier
from flask import Flask, render_template, request
from flask import render_template_string
import logging
app = Flask(__name__)

dataset = pd.read_csv("heart.csv")

X = dataset[["age", "sex", "cp", "trestbps", "chol", "fbs",
             "restecg", "thalach", "exang", "oldpeak", "slope", "ca", "thal"]]

y = dataset["target"]
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.3)
model = RandomForestClassifier(n_estimators=1000, max_depth=5, random_state=42)
model.fit(X_train, y_train)


@app.route('/')
def student():
    return render_template('jb.html')


@app.route('/result', methods=['POST', 'GET'])
def result():
    if request.method == 'POST':
        name = request.form['name']
        age = request.form['age']
        sex = request.form['sex']
        cp = request.form['cp']
        tbps = request.form['trestbps']
        ch = request.form['chol']
        fbs = request.form['fbs']
        re = request.form['restecg']
        tl = request.form['thalach']
        eia = request.form['exang']
        op = request.form['oldpeak']
        sl = request.form['slope']
        ca = request.form['ca']
        thal = request.form['thal']

        print("Before")
        result = model.predict(
            [[age, sex, cp, tbps, ch, fbs, re, tl, eia, op, sl, ca, thal]])[0]
        app.logger.warning(result)

        if sex == "0":
            sex = "Female"
        else:
            sex = "Male"

        if cp == "1":
            cp = "Typical Angina"
        elif cp == "2":
            cp = "Atypical Angina"
        elif cp == "3":
            cp = "Non-Anginal"
        else:
            cp = "Asymptomatic"

        if fbs == "0":
            fbs = "<= 120mg/dl"
        else:
            fbs = "> 120mg/dl"

        if re == "0":
            re = "Normal"
        elif re == "1":
            re = "Abnormal"
        else:
            re = "Hypertrophy"

        if eia == "1":
            eia = "Yes"
        else:
            eia = "No"

        if sl == "1":
            sl = "Upsloping"
        elif sl == "2":
            sl = "Flat"
        else:
            sl = "Dowmslope"

        if thal == "1":
            thal = "Normal"
        elif thal == "2":
            thal = "Fixed Defect"
        else:
            thal = "Reversible Defect"

        if "1" in str(result):
            val = "Normal"
            return render_template("or_res.html", result={name: val}, age=age, gender=sex, chestpain=cp, bloodpres=tbps, chole=ch, fbs=fbs, re=re, tl=tl, eia=eia, op=op, sl=sl, ca=ca, thal=thal)
        elif "0" in str(result):
            val = "Abnormal"
            return render_template("ab_res.html", result={name: val}, age=age, gender=sex, chestpain=cp, bloodpres=tbps, chole=ch, fbs=fbs, re=re, tl=tl, eia=eia, op=op, sl=sl, ca=ca, thal=thal)


if __name__ == '__main__':
    app.run(debug=True)
