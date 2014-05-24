####################################
# Main script for the course project
####################################
rm(list = ls(all = TRUE))   # Clear global environment
library(data.table)         # data.table package used for aggregation
source("loadData.R")        

data.dir <- "UCI HAR Dataset"
data <- data.table(rbind(loadData(data.dir,"test"),loadData(data.dir,"train")))
data.aggregated <- data[, lapply(.SD,mean), by = "subject,activity"]
write.csv(data.aggregated,"tidydata.csv",row.names=F)