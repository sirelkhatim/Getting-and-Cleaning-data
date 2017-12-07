###Get the required packages
library(downloader)
library(data.table)
##define the url
url<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
#Download the UCI zip file
download(url, dest="dataset.zip", mode="wb")
##unzip the file to the current location
unzip("dataset.zip", exdir = ".")
##define the base path
base_path<-paste0(gsub("/", "\\\\", getwd()), "\\UCI HAR Dataset")

####Load the files####
##Load activity labels
activity_labels <-read.table(paste0(base_path, "\\activity_labels.txt"))[,2]

##Extract the features
features<-read.table(paste0(base_path, "\\features.txt"))[,2]
extract_features <-grepl("mean|std", features)

##Training data
Xtrain<-read.table(paste0(base_path,"\\train\\X_train.txt"))
Ytrain<-read.table(paste0(base_path, "\\train\\Y_train.txt"))

##Testing data
Xtest<-read.table(paste0(base_path, "\\test\\X_test.txt"))
Ytest<-read.table(paste0(base_path, "\\test\\Y_test.txt"))

##Load subject
subject_train<-read.table(paste0(base_path,"\\train\\subject_train.txt"))
subject_test<-read.table(paste0(base_path,"\\test\\subject_test.txt"))

##set the column names to the features for easier readability
names(Xtrain) <- features
names(Xtest) <- features

##Extract mean and standard deviation only from both training and testing sets
Xtrain <-Xtrain[,extract_features]
Xtest <- Xtest[,extract_features]
##Load activity labels for training and testing set
#Training
Ytrain[,2] = activity_labels[Ytrain[,1]]
names(Ytrain) = c("Activity_ID", "Activity_Label")
names(subject_train) = "subject"
#Testing
Ytest[,2] = activity_labels[Ytest[,1]]
names(Ytest) = c("Activity_ID", "Activity_Label")
names(subject_test) = "subject"

##Bind features and target data together
train = cbind(as.data.table(subject_train), Xtrain, Ytrain)
test = cbind(as.data.table(subject_test), Xtest, Ytest)

#merge training and testing set together
data = rbind(train,test)

labels = c("subject", "Activity_ID", "Activity_Label")
dlabels = setdiff(colnames(data), labels)

melted = melt(data, id = labels, measure.vars = dlabels)
data_tidy = dcast(melted, subject + Activity_Label ~ variable, mean)
write.table(data_tidy, file = "./data_tidy.txt")
  