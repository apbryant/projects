import csv
import numpy as np
from nltk.stem.snowball import SnowballStemmer
from nltk.corpus import stopwords
from sklearn.feature_extraction.text import TfidfVectorizer
from sklearn.metrics import precision_score, recall_score
from sklearn.naive_bayes import GaussianNB

text = []
features = []
labels = []
stop = stopwords.words('english')

# remove u' from stopwords
stop = [word.encode('utf-8') for word in stop]

# load data
with open('nativeSpeakerDetector.csv', 'rU') as csvfile:
    reader = csv.reader(csvfile, delimiter = ';')
    for line in reader:
        text.append(line[0])
        labels.append(line[1])

# remove stop words
for line in text:
    line = unicode(line, errors = 'ignore')

no_stopwords = []

for line in text:
    split = line.split()
    for word in split:
        if word in stop:
            split.remove(word)
    line = ' '.join(split)
    no_stopwords.append(line)

# stem words
no_stopwords_or_stems = []
stemmer = SnowballStemmer('english')
for line in no_stopwords:
    split = line.split()
    try:
        wordList = []
        for word in split:
            
            word = stemmer.stem(word.encode('utf-8', errors = 'ignore'))
            wordList.append(word)
        newLine = ' '.join(wordList)
        no_stopwords_or_stems.append(newLine) 
    # up... causing a UnicodeDecodeError
    except UnicodeDecodeError:
        continue
        
# make features    
for line in text:
    features.append(line)
 
# change label data type from string to int
labels = [int(i) for i in labels]
    
# create train and test variables
features_train, features_test, labels_train, labels_test = train_test_split(
        features, labels, test_size=0.2, random_state=42)

# transform and fit features
vectorizer = TfidfVectorizer(stop_words='english')
features_train = vectorizer.fit_transform(features_train).toarray()
features_test  = vectorizer.transform(features_test).toarray()

# fit and test NB classifier
clf = GaussianNB()
clf.fit(features_train, labels_train)
pred = clf.predict(features_test)

# print accuracy, precision, recall
print "accuracy: ", clf.score(features_test, labels_test)
print "precision: ", precision_score(labels_test, pred, average = 'binary')
print "recall: ", recall_score(labels_test, pred)
