# Happiness Data Regression

## Summary:

I used a regression model to predict country hapiness scores in the 2016 world happiness report, and make predictions for 2017.

## Question:

Can we train a computer to predict a country's happiness based on input from the World Happiness Report?

## Overview of data:

The World Happiness Report is a global survey that quantifies the mean happiness level in each country on earth. Each country has a ranking, a happiness score, and measurements of various indicators that could correspond to happiness, such as GDP and life expectancy. The datasets can be found at kaggle.com. The happiness score represents the average reponse for country where residents rank their lives on the Cantril ladder a scale where zero is an imagined worst possible life and ten an imagined possible life. 

The scores for the variables represent the extent that the variable increases happiness beyond Dystopia, an imaginary country that has the lowest scores for all six variables.

The dystopia residual is a variable comprised of the sum of the calculated vaules for Dystopia and a country's residuals; i.e. how much of the happiness score cannot be explained by the model.

## Model selection:

I decided on a regression model because of the structure of the data as well as the question I wanted to answer. Happiness is a function of a combination of various things. For example, generally, the higher a country's GDP, the higher its happiness score. A linear regression is a good choice to model this relationship.

## Feature selection:

I picked features that I thought best modeled happiness. GDP is important to happiness, but other factors, such as the level of corruption and personal freedom, could have an effect as well. The features I selected were GDP, Dystopia Residual, Family, and Trust.

## Model peformance:

With the basket of variable selected, the model achieves accuracy in the mid-90s. Trial and error with other combinations of features yields much lower accuracy.