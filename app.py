from flask import Flask, render_template, request, url_for
from flask_bootstrap import Bootstrap
from textblob import TextBlob
from vaderSentiment.vaderSentiment import SentimentIntensityAnalyzer
from flask import (
    Flask,
    g,
    redirect,
    render_template,
    request,
    session,
    url_for
)
# NLP Packages
from textblob import TextBlob, Word
import random
import time
import nltk
app = Flask(__name__)


class User:
    def __init__(self, id, username, password):
        self.id = id
        self.username = username
        self.password = password

    def __repr__(self):
        return f'<User: {self.username}>'


users = []
users.append(User(id=1, username='grtvishnu', password='vishnuchettangreat'))
users.append(User(id=2, username='pip', password='pipisabitch'))
users.append(User(id=3, username='arjun', password='arjunisalsobitch'))
users.append(User(id=4, username='lidhin', password='nutndbolt'))

app = Flask(__name__)
app.secret_key = 'somesecretkeythatonlyishouldknow'


@app.before_request
def before_request():
    g.user = None

    if 'user_id' in session:
        user = [x for x in users if x.id == session['user_id']][0]
        g.user = user


@app.route('/', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        session.pop('user_id', None)

        username = request.form['username']
        password = request.form['password']

        user = [x for x in users if x.username == username][0]
        if user and user.password == password:
            session['user_id'] = user.id
            return redirect(url_for('index'))

        return redirect(url_for('login'))

    return render_template('login.html')


@app.route('/main')
def index():

    return render_template('index_back.html')


@app.route('/analyse', methods=['POST', 'GET'])
def analyse():
    start = time.time()
    if request.method == 'POST':
        rawtext = str(request.form['rawtext'])
        # NLP Stuff
        analyzer = SentimentIntensityAnalyzer()
        vs = analyzer.polarity_scores(rawtext)
        blob = TextBlob(rawtext)
        received_text2 = blob
        blob_sentiment, blob_subjectivity = blob.sentiment.polarity, blob.sentiment.subjectivity
        number_of_tokens = len(list(blob.words))
        # Extracting Main Points
        nouns = list()
        for word, tag in blob.tags:
            if tag == 'NN':
                nouns.append(word.lemmatize())
                len_of_words = len(nouns)
                rand_words = random.sample(nouns, len(nouns))
                final_word = list()
                for item in rand_words:
                    word = Word(item).pluralize()
                    final_word.append(word)
                    end = time.time()
                    final_time = end-start

    # return render_template('shal_1.html',received_text = vs,number_of_tokens=number_of_tokens,blob_sentiment=blob_sentiment,blob_subjectivity=blob_subjectivity,final_time=final_time)

        if (blob_sentiment <= 0):
            return render_template('tour.html')
        else:
            return render_template('new1.html')


@app.route('/route/')
def route1():
    return render_template('beck.html')
#app.run(debug = True,port = 8080,host = '0.0.0.0')
@app.route('/doccode/')
def doccode():
    return render_template('doccode.html')


@app.route('/mus/')
def mus():
    return render_template('mus.html')


@app.route('/img/')
def img():
    return render_template('img.html')


if __name__ == '__main__':
    app.run(debug=True, port=8080)
