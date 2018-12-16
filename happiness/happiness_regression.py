import pandas as pd
import quandl, math, datetime
import numpy as np
from sklearn import preprocessing, cross_validation, svm
from sklearn.linear_model import LinearRegression
import matplotlib.pyplot as plt
from matplotlib import style
import pickle
import csv

# read in data
scores2016 = pd.DataFrame.from_csv('happiness2016.csv')
scores2017 = pd.DataFrame.from_csv('happiness2017.csv')

# select important variables. dystopia residual makes a difference
scores2016 = scores2016([['Happiness Score',
													'Economy (GDP per Capita)',
													'Dystopia Residual',
													'Family',
													'Trust (Government Corruption)']])
scores2017 = scores2017([['Happiness.Score',
													'Economy..GDP.per.Capita.',
													'Dystopia.Residual',
													'Family',
													'Trust..Government.Corruption.']])

# create features and labels
X = np.array(scores2016.drop(['Happiness Score'], 1))
y = np.array(scores2016['Happiness Score'])
X_train, X_test, y_train, y_test = cross_validation.train_test_split(
        X, y, test_size = 0.2)

# train and test model
clf = LinearRegression()
clf.fit(X_train, y_train)
accuracy = clf.score(X_test, y_test)
print(accuracy)

# use model to predict scores for following year
X = np.array(scores2017.drop(['Happiness.Score'], 1))
y = np.array(scores2017['Happiness.Score'])

X_train, X_test, y_train, y_test = cross_validation.train_test_split(
        X, y, test_size = 0.2)

predictions = clf.predict(X_test)



