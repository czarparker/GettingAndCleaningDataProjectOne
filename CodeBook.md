## CODEBOOK

### Description of Variables

1.  Original data.frames are created to read the associated tables:
  * xtest:  <b>X_test.txt</b>
  * xtrain:  <b>X_train.txt</b>
  * ytest:  <b>y_test.txt</b>
  * ytrain:  <b>y_train.txt</b>
  * actlabels:  <b>activity_labels.txt</b>
  * features:  <b>features.txt</b>
  * testsubjects:  <b>subject_test.txt</b>
  * trainsubjects:  <b>subject_train.txt</b>
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

1.  First, just the columns and column names containing _mean()_ and _std()_ are extracted from the original datasets and stored in xtesttrim, xtraintrim and colheadtrim.
2.  Second, yest and ytrain are merge with actlabels.  The activity labels from these merged data.frames are column bound to xtesttrim and xtesttrain.
3.  Minor clean of the column names in colheadtrim is performed to remove "(", ")", and "-".  Additionally, "std" and "mean" are changed to "Std" and "Mean".
4.  The column headings for "subjectid" and "activity" are column bound to the colheadings.
5.  The column headings are then added to xtestfinal and xtrainfinal.
6.  To create a single, combined dataset, xtestfinal and xtrainfinal are row bound together into xtotal.
7.  The data from xtotal is the summarized using summarise_each from the dplyr library and the average of each column by subject and activity is then written to a text file called <b>summary_results.txt</b>

