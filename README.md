# Getting and Cleaning Data Course Project

This repository contains the R script and documentation for the Week 4 final project of the Getting and Cleaning Data Coursera course.

## Files in this Repository

*   `run_analysis.R`: The R script used to perform the data cleaning and preparation pipeline.
*   `CodeBook.md`: A code book that describes the variables, the data, and the transformations performed to clean up the data.
*   `FinalTidyData.txt`: The final exported tidy dataset containing the average of each variable for each activity and each subject.

## Data Source
The data used in this project represents accelerometer and gyroscope recordings collected from 30 subjects wearing a Samsung Galaxy S II smartphone on their waists during daily activities.

## How the Script Works
The `run_analysis.R` script executes the following stages to tidy the data:
1.  Loads the required `dplyr` library.
2.  Reads the feature names and activity labels.
3.  Loads both the training and test datasets (subjects, activities, and measurements).
4.  Merges the test and training sets into one comprehensive data frame.
5.  Extracts columns containing mean (`mean`) and standard deviation (`std`) values.
6.  Replaces numeric activity codes with descriptive activity names (e.g., WALKING).
7.  Labels the dataset with clear, human-readable variable names (expanding abbreviations like `Acc` to `Accelerometer` and `Gyro` to `Gyroscope`).
8.  Groups the data by subject and activity to calculate the mean of each variable.
9.  Writes the final summarized dataset into `FinalTidyData.txt`.
