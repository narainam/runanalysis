The following variables have been used in the run_analysis file:

    features: This variable contains the feature names as read from the features.txt file. There are 561 of these, and have been used as column labels
    
    activitylabels: This variable contains 6 activity labels that are read from the activity_labels.txt file 
    
    c: This variable will store only the column names as extracted from the features dataframe
    
    ytest: This variable takes the values from the y_test file with test data; the values will be used to derive the corresponding activity labels read earlier
    
    ytest2: This variable will hold the activity lables corresponding to the values in ytest 
    
    subject_test: This variable contains the contents of the subject_test.txt file, which list out the sequence of subjects that performed the experiment and are part of the test data set
    
    xtest: This variable contains the contents of the x_test.txt file, which contains the actual readings
    
    testfr: This variable contains the frame with all test data, with the column names assigned, and activity names & Subject reference added as additional columns
    
    ytrain: This variable takes the values from the y_train file with train data; the values will be used to derive the corresponding activity labels read earlier
    
    ytrain2: This variable will hold the activity lables corresponding to the values in ytrain 
    
    subject_train: This variable contains the contents of the subject_train.txt file, which list out the sequence of subjects that performed the experiment and are part of the train data set
    
    xtrain: This variable contains the contents of the x_train.txt file, which contains the actual readings
    
    trainfr: This variable contains the frame with all train data, with the column names assigned, and activity names & Subject reference added as additional columns

    result: This frame contains the combined test and train data sets

    cols: This variable contains the columns that we will need for just the Subject, Activity, and the mean and standard deviation data
    
    subset: This is the dataframe that contains the test and train readings for mean and standard deviation columns, and the Subject and Activity labels
    
    sb1: This variable contains the melted dataframe as a first step to calculating the mean of each variable for each activity and each subject. This variable is obtained after applying 'melt' from the 'reshape2' library to the 'subset' dataframe. The sb1 dataframe will have a row each for each reading of each combination of Subject, Activity, & Feature. This will be a 'long' dataset.
    
    sb2: This variable will store the value of 'dcast' (from the 'reshape2' library) applied to the above sb1 dataset, with the application of mean on each of the features (by choosing a Subject+Activity combination in the dcast function). Sb2 will therefore be the 'tidy' dataset required in Step#5, and is back to being a 'wide' dataset.
