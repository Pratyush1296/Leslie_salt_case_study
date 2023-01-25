# Leslie_salt_case_study

Problem: To determine a fair market value for the property based on collected data on 31 bayland properties that were sold in the last 10 years. 

|Variable Name|Description|
|-------------|-----------|
|Price|Sales price in $000 per acre|
|County|San Mateo=0, Santa Clara=1|
|Size|Size of the property in acres|
|Elevation|Average Elevation in foot above sea level|
|Sewer|Distance (in feet) to nearest sewer connection|
|Date|Selling Date counting backwards (in months)|
|Flood|Subject to flooding by tidal action =1; otherwise=0|
|Distance|Distance in miles from Leslie Property|

Method and Solution Proposed: Use of Regression Analysis to predict the price based on given independent variables

Steps Used for Analysis:
- The categorical variables are converted to the appropriate format (factor) for processing instead of the default integer
- Correlation between variables was computed in order to check for multicollinearity
- The regression model is built with all independent variables being considered; each independent variable is removed stepwise from the initial model to get the most significant variables based on the ajdusted R2 value
- The normality assumption on the residuals are also checked and an outlier is detected (point 26). A new model is built after removing the outlier. 
- Since normality assumption was still not satisfied, log transform was applied on the price of the property and a similar stepwise regression is followed to get the final model 

Conclusions:
- The final model for predicting the price was given as :
$log(Price) = \beta_0 + \beta_1 \times Elevation + \beta_2 \times Sewer + \beta_3 \times Date + \beta_4 \times Flood + \beta_5 \times Distance$
- No significant multicollinearity was found in the data 
- Shapiro-Wilk test was used to test for normality
- Adjusted R-Square was used as the metric for model-fit as it ensures the proper balance between the number of variables and inclusion of significant variables. The value for final model was found to be 0.8003. 
