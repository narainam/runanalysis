run_analysis <- function() {

    ##features will be column names (561 of these)
    features <- read.table("./UCI HAR Dataset/features.txt")
    
    ##6 activity labels - use to derive text 
    activitylabels <- read.table("./UCI HAR Dataset/activity_labels.txt")
    
    ##reading column names
    c<- features[,2]
    
    
    #################
    ##Test data set##
    #################
    
    
    ##Ingest and replace with activity labels depending on values
    ytest <- read.table("./UCI HAR Dataset/test/y_test.txt")
    
    ##creating ytrain2 vector to hold descriptive activity names
    i <- 1
    ytest2 <- vector(mode="character", length=length(ytest[,1]))
    while(i <= length(ytest[,1])) {
        ytest2[i] <- as.character(activitylabels[as.numeric(ytest[i,1]),2])
        i <- i+1
    }
    
    ##Who all performed activity
    subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
    
    ##readings - make features the columns and subject_test one more column
    xtest <- read.table("./UCI HAR Dataset/test/x_test.txt")
    
    ##assigning column names
    colnames(xtest) <- c
    
    ##adding the subject_test & & Activity names columns to xtest
    testfr <- cbind(Subject = subject_test[,1],Activity = ytest2,xtest)
    
    ##################
    ##Train data set##
    ##################
    
    ##Ingest and replace with activity labels depending on values
    ytrain <- read.table("./UCI HAR Dataset/train/y_train.txt")
    
    ##creating ytrain2 vector to hold descriptive activity names
    i <- 1
    ytrain2 <- vector(mode="character", length=length(ytrain[,1]))
    while(i <= length(ytrain[,1])) {
        ytrain2[i] <- as.character(activitylabels[as.numeric(ytrain[i,1]),2])
        i <- i+1
    }
        
    ##Who all performed activity
    subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
    
    ##readings - make features the columns and subject_test one more column
    xtrain <- read.table("./UCI HAR Dataset/train/x_train.txt")
    
    colnames(xtrain) <- c
    
    ##adding the subject_train & Activity names columns to xtrain
    trainfr <- cbind(Subject = subject_train[,1],Activity = ytrain2,xtrain)
    
    ##combining test and train datasets
    result <- rbind(testfr,trainfr)
    
    ##sorting the resulting dataset by Subjects
    result <- result[order(result$Subject),]
    row.names(result) <- NULL

    ##Steps#1 #3 #4 complete. 'result' is the Merged dataset

    cols <- 1:2
    cols <- c(cols,grep("mean",names(result)))
    cols <- c(cols,grep("std",names(result)))
    subset <- result[,cols]
    
    ##Step#2 is complete. 'subset' is the dataset with mean & std dev.
    
    ##loading reshape2 library
    library (reshape2)
        
    ##Using melt and dcast for finding mean by combination of Subject & activity 
    sb1 <- melt(subset, id=c("Subject","Activity"))
    sb2 <- dcast(sb1, Subject+Activity ~ variable, mean)
    ##Step#5 is complete. 'sb2' is the tidy dataset
    
    write.table(sb2, "./UCI HAR Dataset/step5.txt",row.names=FALSE) 
    ##Written to file

}

