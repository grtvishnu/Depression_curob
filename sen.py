import nltk

from textblob import TextBlob

from vaderSentiment.vaderSentiment import SentimentIntensityAnalyzer

analyzer = SentimentIntensityAnalyzer()

vs = analyzer.polarity_scores("I hate my life")
print(vs)

