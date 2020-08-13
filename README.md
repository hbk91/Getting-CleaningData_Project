# Getting and Cleaning Data Course Project (Coursera)

1. **Project Overview

The purpose of this project is to demonstrate the ability to collect, work with, and clean a data set. An R script titled "run_analysis.R" has been created to fulfill the project requirements.

2. **run_analysis.R**

The included script in this repository, delivers the following:

-*Load the Necessary Packages*: data.table and dplyr are loaded into the R script. 
- *Download the Dataset": The Data Set is downloaded into the "/Course 3/Week 4" subdirectory, inside the current work directory.
- *Unzip the Dataset* : The zipped dataset is then unzipped into the current working directory.
- *Read the Data*: The data for measurements (X), labels(y), activities, subjects and feautres is loaded into the R script both for training and testing sets.
- *Merge the Data*: Data for train and test sets is then merged together.
- *Filter the desired feature columns*: Feautres with mean() and std() in their names are then filtered out. After this opertion, 66 feautres remain out of the original 561.
- *Rename feature columns*: Feautre columns are renamed to make them tidy. Special characters viz. comma and parantheses are removed from the feautre names. Additionally, mean and std's first character is made uppercase.
- *Rename labels with Descriptivs names": The labels (y) for observations are renamed with descriptive names viz. Laying, Standing etc.
- *Add activity and subject details to the measurement dataset":  Activity and Subject Details are added to the measurement dataset.
- *Create a Tidy Dataset*: A tidy dataset is created by grouping acitivities and subjects and by averaging feature values within these groups. The final result, included in this repo, is available as a csv file titled 'data_tidy.csv'.

3. **CodeBook.md**:

This included file further elaborates on the features created and how they are summarized.
