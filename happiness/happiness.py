import csv
import os
from functions import *

os.getcwd()

path1 = './datasets/happiness2015.csv'
path2 = './datasets/happiness2016.csv'
path3 = './datasets/happiness2017.csv'

h2015 = []
h2016 = []
h2017 = []

# read in csv files
# create a list of dictionaries

h2015 = opener(path1, h2015) 
h2016 = opener(path2, h2016)
h2017 = opener(path2, h2017)
   
# check length
print len(h2015), len(h2016), len(h2017)

# lengths not equal. find out which countries are different

country2015 = []
country2016 = []
country2017 = []
in_all = []

country_list(h2015, country2015)
country_list(h2016, country2016)
country_list(h2017, country2017)

for country in country2016:
    if country in country2015 and country in country2017:
        in_all.append(country)

# only use countries that are in all three datasets
h2015 = country_remove(h2015, in_all)
h2016 = country_remove(h2016, in_all)
h2017 = country_remove(h2017, in_all)

print len(h2015_clean), len(h2016_clean), len(h2017_clean)


# write new csv files. code from: http://bit.ly/2tq9BqN

write_csv(h2015, 'h2015.csv')
write_csv(h2016, 'h2016.csv')
write_csv(h2017, 'h2017.csv')


        