# Course project for Coursera class "Getting and Cleaning Data"

This repository contains my submission to [Coursera](https://www.coursera.org) ["Getting And Cleaning Data"](https://class.coursera.org/getdata-002) course project.

The submission is composed of a script called 'run_analysis.R', a code book named 'CodeBook.md' and this file, 'README.md'.

The code book describe the variables.

'run_analysis.R' can be run as long as the Samsung data is unzipped into your R working directory.
It does the following:
1. Read data
2. Do some transformations to tidy data
3. create the tidy dataset called 'tidyDataset' in the environment for later use
4. apply transformation to the tidy dataset, in order to produce a summarized dataset
5. create the summarized dataset called 'meanDataset' in the environment for later use
6. Write the summarized dataset to 'output.txt' for Coursera submission
