from flask import Flask, render_template, request, url_for
from flask_bootstrap import Bootstrap
from textblob import TextBlob
from vaderSentiment.vaderSentiment import SentimentIntensityAnalyzer

# NLP Packages
from textblob import TextBlob, Word
import random
import time
import nltk
app = Flask(__name__)


@app.route('/')
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
