There is one R script with one R function for carrying out the transformations required as part of the Getting and Cleaning Data assignment from Coursera.

The R file is run_analysis.R, with one function 'run_analysis'. It needs to be placed in the same folder as where the UCI HAR Dataset is placed. It also includes the one library required as part of the execution, so no additional libraries need to be included separately.

The script writes the final tidy data set file to the UCI HAR Dataset folder. 

The sequence of steps that were followed to complete the requirement were:

1. Read the features file
2. Read the activity labels file
3. Extract the data from the features file to get column names for our dataset
4. For both test and train data:
4a. Read the numeric equivalents of Activity labels for each reading and derive the corresponding text
4b. Read the subject reference numbers
4c. Read the actual readings
4d. Create one frame with the features for column names for the readings, with Subject, Activity labels as additional columns
5. Combine the Test and Train datasets
6. Sort the data sets by subject
7. Create the list of columns that we will need for just the mean and standard deviation (and including Subject and Activitylabels)
8. Subset the dataframe created in Step#6 above with just the columns we need (as per Step#7)
9. Use 'melt' as a first step to calculating the mean of each variable for each activity and each subject. Apply 'melt' from the 'reshape2' library to the dataframe in Step#8toget a frame with a row each for each reading of each combination of Subject, Activity, & Feature.
10. Use 'dcast' as the last step, with the application of mean on each of the features (by choosing a Subject+Activity combination in the dcast function). The resulting dataset will therefore be the 'tidy' dataset required.
11. Write the final dataset to file.

