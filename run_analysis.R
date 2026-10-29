# run_analysis.R
# Final Project: Getting and Cleaning Data

library(dplyr)

# IMPORTANT: Make sure that the extracted "UCI HAR Dataset" folder
# is located inside your current R working directory.

message("Loading configuration files...")
# Read features names (columns) and activity labels
features <- read.table("UCI HAR Dataset/features.txt", col.names = c("n", "functions"))
activities <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("code", "activity"))

message("Loading TEST dataset...")
# Load test group data
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
x_test <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = features$functions)
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "code")

message("Loading TRAIN dataset...")
# Load training group data
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
x_train <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = features$functions)
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "code")

# ==============================================================================
# STEP 1: Merge the training and the test sets to create one data set
# ==============================================================================
message("Step 1: Merging datasets...")
X_combined <- rbind(x_train, x_test)
Y_combined <- rbind(y_train, y_test)
Subject_combined <- rbind(subject_train, subject_test)
Merged_Data <- cbind(Subject_combined, Y_combined, X_combined)

# ==============================================================================
# STEP 2: Extract only the measurements on the mean and standard deviation
# ==============================================================================
message("Step 2: Extracting mean and standard deviation measurements...")
TidyData <- Merged_Data %>% 
  select(subject, code, contains("mean"), contains("std"))

# ==============================================================================
# STEP 3: Use descriptive activity names to name the activities in the data set
# ==============================================================================
message("Step 3: Assigning descriptive activity names...")
TidyData$code <- activities[TidyData$code, 2]

# ==============================================================================
# STEP 4: Appropriately label the data set with descriptive variable names
# ==============================================================================
message("Step 4: Cleaning up variable names...")
names(TidyData)[2] = "activity"
names(TidyData) <- gsub("Acc", "Accelerometer", names(TidyData))
names(TidyData) <- gsub("Gyro", "Gyroscope", names(TidyData))
names(TidyData) <- gsub("BodyBody", "Body", names(TidyData))
names(TidyData) <- gsub("Mag", "Magnitude", names(TidyData))
names(TidyData) <- gsub("^t", "Time", names(TidyData))
names(TidyData) <- gsub("^f", "Frequency", names(TidyData))
names(TidyData) <- gsub("tBody", "TimeBody", names(TidyData))
names(TidyData) <- gsub("-mean\\(\\)", "Mean", names(TidyData), ignore.case = TRUE)
names(TidyData) <- gsub("-std\\(\\)", "STD", names(TidyData), ignore.case = TRUE)
names(TidyData) <- gsub("-freq\\(\\)", "Frequency", names(TidyData), ignore.case = TRUE)
names(TidyData) <- gsub("angle", "Angle", names(TidyData))
names(TidyData) <- gsub("gravity", "Gravity", names(TidyData))

# ==============================================================================
# STEP 5: From the data set in step 4, creates a second, independent tidy 
#         data set with the average of each variable for each activity and subject
# ==============================================================================
message("Step 5: Generating the final summary tidy dataset...")
FinalData <- TidyData %>%
  group_by(subject, activity) %>%
  summarise_all(list(mean = mean))

# Write the final tidy data set to a text file for Coursera submission
write.table(FinalData, "FinalTidyData.txt", row.name = FALSE)
message("Done! The 'FinalTidyData.txt' file has been successfully created.")
