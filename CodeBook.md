## CODEBOOK

### Description of Variables

1.  Original data files are loaded into the following:
2.  xtesttrim, xtraintrim, and colheadtrim:  contain only the mean and std columns that will be used for summary analysis
3.  xtestfinal and xtrainfinal:  subject ids and activity labels columns are added to the xtesttrim and xtraintrim data.frames
4.  colheadings:  combines colheadtrim with the subject id and activity label column names
5.  xtotal:  combines both the xtestfinal and xtrainfinal data.frames
6.  summarytable:  the summary data.frame that contains the average of the columns by subject and activity


### Description of the Data

The data is broken up into the following files:

1.  Variable Names (Column Names):  <b>features.txt</b>
2.  Activity Labels:  <b>activity_labels.txt</b>
3.  Activity ID data:  <b>y_test.txt</b> and <b>y_train.txt</b>
3.  Subject ID Numbers (Row labels):  <b>subject_test.txt</b> and <b>subject_train.txt</b>
4.  Data files (columns matching features.txt names):  <b>X_test.txt</b> and <b>X_train.txt</b>


### Transformations / Data Cleanup
