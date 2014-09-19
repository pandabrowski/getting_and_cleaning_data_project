#load the files, assuming that script file is located in main 'UCI HAR Dataset' folder

#load names for the columns
features <- read.table("features.txt" , stringsAsFactors = FALSE);
#load activity names
activity_labels <- read.table("activity_labels.txt" , stringsAsFactors = FALSE);

#load files from the test set
subject_test <- read.table("./test/subject_test.txt")
X_test <-read.table("./test/X_test.txt")
y_test <-read.table("./test/y_test.txt")

#load files from the train set
subject_train <- read.table("./train/subject_train.txt")
X_train <-read.table("./train/X_train.txt")
y_train <-read.table("./train/y_train.txt")

#merge files set
x_binded <- rbind(X_train , X_test)
y_binded <- rbind(y_train, y_test)
subject_binded <- rbind(subject_test , subject_train)

#remove unnecessary variables
remove(X_train,X_test , y_train, y_test, subject_test , subject_train)

#apply names of the features to the proper columns. transposition needed, only column with the names is used.
names(x_binded) = t(features)[2,]

#pick only feature columns with standard deviation or means.
std_features <- grep("-std\\(\\)-", names(x_binded) ,  value=TRUE) 
mean_features <- grep("-mean\\(\\)-", names(x_binded) ,  value=TRUE)
matching_features <- rbind ( matrix(mean_features, ncol = 1) , matrix(std_features, ncol = 1))

#remove unnecessary variables
remove(std_features,mean_features)

#get indexes of features with matching names
matching_features_index <- which(names(x_binded) %in% matching_features)

#remove unwanted rows from the table
x_binded <- x_binded[,matching_features_index]

#replace name of the first column.
names(subject_binded) <- c('Person')

#apply character descriptions to the dataset, replacing numeric values of the activities.
y_activity <- sapply(y_binded[,1] , function(x)  activity_labels[x,2]) 

#merge all three datasets with activities, subjects(people) and measurements into one table
int_table <- cbind(y_activity , subject_binded ,x_binded , stringsAsFactors = FALSE )

#rename activity column
names(int_table)[1] <- "Activity"

#remove unnecessary variables
remove(matching_features_index,x_binded,y_binded,y_activity, activity_labels, features, matching_features ,  subject_binded)

library(plyr)
#calculate summary of the tables, applying mean as an aggregation function, grouping by activity and person
summary_mean <- ddply(int_table , .(Activity, Person), numcolwise(mean) )

#remove unnecessary table
remove(int_table)


#change metric names to the more readable format

input_names <- names(summary_mean)
input_names <- gsub( '^t' , 'Time_' , input_names)
input_names <- gsub( '^f' , 'Frequency_' , input_names)
input_names <- gsub( 'Body' , 'Body' , input_names)
input_names <- gsub( 'Gravtity_' , 'Gravity_' , input_names)
input_names <- gsub('AccJerk', '_Accelerometer_Jerk' , input_names)
input_names <- gsub('GyroJerk', '_Accelerometer_Jerk' , input_names)
input_names <- gsub('Acc-', '_Accelerometer_LinearAcceleration_' , input_names)
input_names <- gsub('Gyro-', '_Gyroscope_AngularVelocity_' , input_names)
input_names <- gsub( '\\(\\)' , '' , input_names)
input_names <- gsub( '-' , '_' , input_names)
input_names <- gsub( 'mean' , 'Mean' , input_names)
input_names <- gsub( 'std' , 'StandardDeviation' , input_names)
names(summary_mean) <- input_names

#remove unnecessary table
remove(input_names)

#write cleaned data into the file 'summary_mean.txt'
write.table(summary_mean, 'summary_mean.txt' , row.name = FALSE)