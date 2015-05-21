# GettingAndCleaningDataProjectOne

README

Included:

  source file for tidying data:  run_analysis.R
  
  Tidy dataset output:  summary_analysis.txt
  
  this README


Summary:  

1.	The run_analysis.R code begins by reading in all the necessary files located within the UCI HAR Dataset directory stored in the user’s working directory.  The UCI HAR Dataset was downloaded directly from the following location and was not modified in any way prior to the running of "run_analysis.R":  https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

2.	The test, train, and column labels files are then trimmed down to only those columns containing “mean()” or “std()” data using grepl.

3.	The ytest and ytrain files are merged with the activity_labels file in order to link up the activity number with the actual activity name.

4.	The second column of this merged data is cbind’ed with the test and train subject id files (subject test and subject train) as well as the raw data created in step 2.

5.	A small amount of cleaning is done for the column names by removing parentheses and commas and adjusting to proper case where needed.

6.	The column names are now added to the test and train data from step 4.

7.	The test and train data from step 4 is rbind’ed together to form a single data set.

8.	The summarize_each function from the dplyr library is used to take the mean of each column by subjected and activity.

9.	This table is then output to the txt file summary_analysis.txt using write_table.
