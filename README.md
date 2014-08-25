Getting-and-Cleaning-Data
=========================

Getting and Cleaning Data Course Project

In this Github repo is the code to perform the analysis of the data set of the final project of the course. 



The code described in run_analysis.R file located in the user's home directory, provided it is properly installed and Samsung lower the data is in your working directory, you can run. 
The output is the sorted data set that mestran in text files, one sorted data and the other averages (as indicated in step five of the instructions). 

This file "README.md" describes how the script and the codebook variables describing their work. 

Script: See run_analysis.R code.

R script called run_analysis.R
==========================================R 
===========================================
The R script.Merges the training and the test sets to create one data set.
Extracts only the measurements on the mean and standard deviation for each measurement.
Uses descriptive activity names to name the activities in the data set
Appropriately labels the data set with descriptive activity names.
Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

A full description is available at the site where the data was obtained:
Original description: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Original Dataset(zip file): 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

Step 1

   Download a file from the web  
   fileUrl <- "link?accessType=DOWNLOAD"  
   download.file(fileUrl, destfile = "directory/fileName.ext", method = "curl")  

Step 2

    Unzziped the file
    Set working directory setwd() 
    Unzipped the data set in 'UCI_HAR_Dataset'
    The dataset directory is same as this script.  

Step 3

    Package Check and Install
    library(reshape2)

Step 4

    Read dataset

Step 5

    Import and prepare the test Data
    Import and prepare the train Data
 
Step 6

    Make and write the Tidy Data
 
Step 7

    Make the Tidy Data Average/Activity. Melt and Cast.  
 
 
==========================
Codebook: See Code Book
