# -*- coding: utf-8 -*-
"""
Created on Sun Aug  2 15:14:52 2020

@author: Samir
"""
import pandas as pd
import matplotlib.pylab as plt
import numpy as np
import statsmodels.api as sm


covid = pd.read_csv ("https://raw.githubusercontent.com/owid/covid-19-data/master/public/data/owid-covid-data.csv")

country = covid[covid.iso_code == 'USA']
y = country['new_cases']
x = np.arange(len(y))
result = sm.OLS(y, x).fit()
coef = np.polyfit(x,y,1)
poly1d_fn = np.poly1d(coef) 

plt.plot(x,y, x, poly1d_fn(x), '--k')
print(result.summary())
print(result.summary2())
