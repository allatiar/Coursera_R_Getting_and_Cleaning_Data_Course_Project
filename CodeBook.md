# Code Book

This document describes the code inside 'run_analysis.R'.

The code is splitted in three functions :

* createTidyDataset
* createMeanDatasetBySubjectAndActivity
* writeDatasetToTxt

This functions are called at the end of the script to produce the outputs.

## createTidyDataset

Read data X, Y and subject for test and train, from the initial Samsung dataset.
label columns with appropriate variables names.
Extract measurements on the mean and standard deviation from X's datasets.
Use descriptive activity names for Y's datasets.
Create test and train datasets from respective X, Y ans subject datasets.
merge test and train datasets into the final tidied dataset.

### createMeanDatasetBySubjectAndActivity
group the dataset by subject and activity.
summarize by applying the function mean() to the others columns of the dataset.


### writeDatasetToTxt
write dataset to "output.txt" text file, in the working directory.

