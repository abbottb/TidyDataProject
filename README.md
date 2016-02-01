# TidyDataProject
Getting and Cleaning Data Course Project:  Samsung Wearable Device Measurements Analysis

To recreate the "tidy.txt" output file included in this repository:

1.  Download and extract the files from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip, preserving the folder structure of the .zip file
2.  In R, set the working directory to the "UCI HAR Dataset" folder
3.  Ensure that the dplyr package is installed
4.  Run the script found in the "run_analysis.R" file in this repository

The script will read several files from the downloaded dataset, merge them into a single data frame, extract the mean and standard deviation measures, summarize those measures by finding the mean for each activity for each subject, and then generate the "tidy.txt" output file in the working directory.  Detail on how the data is transformed by the script can be found in the codebook.
