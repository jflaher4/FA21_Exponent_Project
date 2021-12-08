library(tidyverse)
library(modelr)
df = read_csv("train.csv")
# create a new variable that shows the total square feet of the interior of
# the house
df <- df %>%
  mutate(TotalSF = TotalBsmtSF + GrLivArea) %>% 
  mutate(AgeAtSale = YrSold - YearRemodAdd)
# Computes the correlation between Total Square Footage and Sale Price.
# The correlation is 0.7789588.
cor(df$TotalSF,df$SalePrice)
cor(df$GrLivArea, df$SalePrice)
df %>% filter(AgeAtSale > 5)
ggplot(df, aes(AgeAtSale, SalePrice)) + geom_point()
# Correlation between age betwen last update (or construction) and date
# of sale is -0.5090787
cor(df$AgeAtSale, df$SalePrice)
# biggest variance for brand new houses
ggplot(df, aes(AgeAtSale, SalePrice)) + geom_point()
#Dividing All Independent Variables into three categories
# Differences from last week:
# 1) Move Street, Alley, Landslope, MoSold, YrSold from rank to non_num as they are not rankings
# (eg: gravel vs. paved)
# 2) Moved OverallQual, YrBuilt, YrRemodAdd, 'BsmtFullBath', 'BsmtHalfBath', 'FullBath', 
#'HalfBath', 'BedroomAbvGr', 'KitchenAbvGr', 'TotRmsAbvGrd', 'Fireplaces', 'GarageYrBlt',
# 'GarageCars' to rank
non_num_vars = c[
  'MSZoning', 'LandContour', 'Utilities',
  'LotConfig', 'Neighborhood', 'Condition1', 'Condition2', 'BldgType',
  'HouseStyle', 'RoofStyle', 'RoofMatl', 'Exterior1st', 
  'Exterior2nd', 'MasVnrType', 'Foundation', 'Heating', 'Electrical', 
  'GarageType', 'MiscFeature', 
  'SaleType', 'SaleCondition', 'Alley', 'Street', 'Landslope', 'Mosold', 'Yrsold'
]
rank_vars = c[
  'OverallCond', 'ExterQual', 'ExterCond', 'BsmtQual', 'BsmtCond',
  'BsmtExposure', 'BsmtFinType1', 'BsmtFinType2', 'HeatingQC', 'KitchenQual',
  'FireplaceQu', 'GarageQual', 'GarageCond', 'PoolQC', 'Fence',
  'Functional', 'GarageFinish', 'PavedDrive', 
  'CentralAir', 'LotShape', 'MSSubClass', 'OverallQual'
]
continuous_vars = c[
  'LotFrontage', 'LotArea', 
  'MasVnrArea', 'BsmtFinSF1', 'BsmtFinSF2', 'BsmtUnfSF', 'TotalBsmtSF', '1stFlrSF', 
  '2ndFlrSF', 'LowQualFinSF', 'GrLivArea', 'GarageArea', 'WoodDeckSF', 'OpenPorchSF',
  'EnclosedPorch', '3SsnPorch', 'ScreenPorch', 'PoolArea', 'MiscVal'
]
discrete_vars = c['YrSold', 'YearBuilt', 'YearRemodAdd', 'AgeAtSale', 
                  'BsmtFullBath', 'BsmtHalfBath', 'FullBath', 
                  'HalfBath', 'BedroomAbvGr', 'KitchenAbvGr', 'TotRmsAbvGrd', 
                  'Fireplaces', 'GarageYrBlt',
                  'GarageCars'
]
#for basement variables in rank vars, lots of NA: filter out and test corr?
has_bsmt <- df %>% filter(BsmtQual != "NA" & BsmtCond != "NA" & 
                            BsmtExposure != "NA" & BsmtFinType1 != "NA")




