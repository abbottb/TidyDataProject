Code Book for Tidy Data Project

===============================

Please note -- This code book describes the work that was done for this project, but does not describe the original dataset.
The original dataset is available at:
  https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
A description of the original dataset is available at:
  http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
  
===============================
COLUMN NAMES
===============================
Variable names for the measurements

  The original files with the measurements (X_train.txt and X_test.txt) did not contain column headers.
  The "features.txt" was used as the column headers for the measurements.
  
subjectID - Values from "subject_train.txt" and "subject_test.txt" files, identifying which of the 30 subjects was
  associated with the measurement.

activityID - Values from "y_train.txt" and "y_test.txt" identifying the activity associated with the measurement.

activityLabel - Values from "activity_labels.txt" providing the description of an activityID.

===============================
WORK PERFORMED
===============================
1. The files "X_train.txt", "y_train.txt", "subject_train.txt", "X_test.txt", "y_test.txt", "subject_test.txt",
  "features.txt", and "activity_labels.txt" were read.
2. Column names were assigned as described in the "Column Names" section above.
3. Columns for activityID and subjectID were added to trainData (from X_train.txt) and testData (from X_test.txt)
4. trainData and testData were combined into combinedData
5. Activity labels were added to combinedData
6. meanStDevData was created with a subset of the columns of combinedData including the subjectID, activityLabel,
  and measurements with "-mean()" or "-std()" in the column header
7. meanStDevSummary was created by grouping meanStDevData by subjectID and activityLabel
8. meanStDevSummary was summarized by mean
9. meanStDevSummary was written to "tidy.txt"
