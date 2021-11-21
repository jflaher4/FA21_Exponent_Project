import pandas as pd
import numpy as np

def add_columns(dataset):
    # Calculated predictor variables
    dataset['TotalSF'] = dataset['GrLivArea'] + dataset['TotalBsmtSF']
    dataset['TotalBsmtBath'] = dataset['BsmtFullBath']+0.5*dataset['BsmtHalfBath']
    dataset['TotalAGBath'] = dataset['FullBath'] + 0.5*dataset['HalfBath']
    dataset['TotalBath'] = dataset['TotalAGBath'] + dataset['TotalBsmtBath']
    dataset['HouseAge'] = dataset['YrSold'] - dataset['YearRemodAdd']
    dataset['TotalInHouseArea'] = dataset['1stFlrSF'] + dataset['2ndFlrSF'] + dataset['TotalBsmtSF']
    dataset['TotalPorchArea'] = dataset['OpenPorchSF'] + dataset['EnclosedPorch'] + dataset['3SsnPorch'] + dataset['ScreenPorch']
    
    # Transformed response variable
    dataset['LogSalePrice'] = np.log(dataset['SalePrice'])
    
    return dataset