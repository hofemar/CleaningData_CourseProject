#####################################################################################
# loadData(dir,type)
#------------------------------------------------------------------------------------
# Input:
# dir   Name of the directory that contains the raw data set
# type  Indicates which data set has to be loaded
#       "train" for the training data set
#       "test"  for the test data set
#------------------------------------------------------------------------------------
# Output:
# data.frame    Cleansed data set
#####################################################################################
loadData <- function(dir="UCI HAR Dataset", type="train") {
    require(data.table)
    oldWD <- getwd();
    
    ucidir <- paste(getwd(),dir,sep="/")
    datadir <- paste(ucidir,type,sep="/")
    
    # Load features and activity labels
    setwd(ucidir)
    features <- read.table("features.txt",stringsAsFactors=F)
    activity.labels<- read.table("activity_labels.txt",stringsAsFactors=F)
    
    # Distill indieces of features for means and standard deviations
    ix <- which(grepl("mean()",features[,2],fixed=T) | grepl("std()",features[,2],fixed=T))
    
    # Generate clean column names
    features[ix,2] <- gsub("-",".",features[ix,2],fixed=T)
    features[ix,2] <- gsub("()","",features[ix,2],fixed=T)
    features[ix,2] <- gsub("BodyBody","Body",features[ix,2],fixed=T)
    features[ix,2] <- gsub("tBody","time.body",features[ix,2],fixed=T)
    features[ix,2] <- gsub("fBody","freq.body",features[ix,2],fixed=T)
    features[ix,2] <- gsub("tGravity","time.gravity",features[ix,2],fixed=T)
    features[ix,2] <- gsub("Acc",".acceleration",features[ix,2],fixed=T)
    features[ix,2] <- gsub("Gyro",".gyro",features[ix,2],fixed=T)
    features[ix,2] <- gsub("Jerk",".jerk",features[ix,2],fixed=T)
    features[ix,2] <- gsub("Mag",".magnitude",features[ix,2],fixed=T)
    features[ix,2] <- tolower(features[ix,2])
    
    # Load data values, subjects and activity indices
    setwd(datadir)
    activity.indices <- read.table(paste0("y_",type,".txt"),stringsAsFactors=F)
    data.full <- read.table(paste0("X_",type,".txt"))
    subjects <- read.table(paste0("subject_",type,".txt"))
    
    # Convert activity indices to names
    activities <- as.data.frame(as.factor(activity.labels[activity.indices[,1],2]))
    
    # Reduce data to mean/std columns
    data.reduced <- data.full[,ix]
    
    # Set meaningful column names
    colnames(activities) <- "activity"
    colnames(subjects) <- "subject"
    colnames(data.reduced) <- features[ix,2]
    
    # Generate dataset
    data <- cbind(subjects,activities,data.reduced)
    
    setwd(oldWD)
    data
}