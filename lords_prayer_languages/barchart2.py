from __future__ import division
import pandas as pd
from pandas import DataFrame
import seaborn as sns
import matplotlib.pyplot as plt

ReadExcel = pd.read_excel("C:\lords_prayer_levenshtein\output.xlsx")
df = DataFrame(ReadExcel)
Index = ["spa", "por", "fra", "ita", "cat", "ron", "lat"]
	
means = {}

for i in Index:
	if i != "lat":
		data = df[df["Language"].str.contains(i)]
		n = 0
		sum = 0
		for row in data.iterrows():
			datum = row[1].values[8]
			n+=1;
			sum+=datum;								
		avg = sum/n
		means[i] = avg
means = sorted(means.iteritems(), key=lambda (k,v): (v,k), reverse = True)
languages = []
dist_from_lat = []
for i in means:
	languages.append(i[0])
	dist_from_lat.append(i[1])

plt.bar(languages, dist_from_lat)
plt.xlabel("Language")
plt.ylabel("Mean Levenshtein distance")
plt.title("Mean Levenshtein distance from Latin")
plt.show()	