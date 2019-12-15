# DevelopingDataProducts
Developing Data Products - Coursera Assignment

Under the life-cycle savings hypothesis as developed by Franco Modigliani, the savings ratio (aggregate personal
saving divided by disposable income) is explained by per-capita disposable income, the percentage rate of change in
per-capita disposable income, and two demographic variables: the percentage of population less than 15 years old and
the percentage of the population over 75 years old. The data are averaged over the decade 1960–1970 to remove the business
cycle or other short-term fluctuations.

The data were accessed from the 'datasets' package through R and originally obtained from Belsley, Kuh and Welsch (1980).
They in turn obtained the data from Sterling (1977).

The dataset includes the five variables described above, with the aggregate personal saving divided by disposable income
('sr') as the dependent variable and the other four variables as the independent variables.

The Shiny app gives the user the option of which of the four independent variables (and combination thereof) to use for 
predicting the dependent variable. The results are shown in the graph on the main panel (blue points) and compares these
to the actual values (red points). The root mean squared error between the actual and predicted values is also returned
to give the user a sense of how valuable an independent variable is in the prediction of the dependent variable.

The prediction is done using multiple linear regression.
