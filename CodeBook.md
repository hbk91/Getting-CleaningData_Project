**Overview of the Data**:

- The full dataset and its description is available at the following link: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
- Essentially the dataset is designed for machine learning tasks for human activity recognition. Each data sample has a 561 feature vector and each sample is categorized into one of the six target labels viz. Laying, Standing, Sitting, Walking Downstairs, Walking Upstairs and Walking.
- The Dataset has a 70-30 split for training and testing.

**Feature Variables**:

- The features record statistical measures such as mean, standard deviation, mean absolute deviation etc for several physical quantities such as Body Accelerating, Gravity Acceleration etc in all three spatial directions viz. X, Y and Z.
- The above statsitical process results in 561 features for each sample.
- For our analysis we have filtered out features that are either mean() or std() among these 561 variables.
- As a result of this operation, 66 feautres are obtained. The names of these variables are modified to make them tidy. Special characters like dash and parantheses have been removed. Further, first letters of 'mean' and 'std' have been capitalized.
- The train and test data have been concatenated.

**Label Variables**:

- Each sample is tagged to its label variables. The two label variables are: 'activity' and 'subject'
- 'activity' is one of the six pre-defined activities that the experiment is tracking. The numeric activity variables have been replaced with their descriptive names.
- 'subject' represents the 30 volunteers that took part in this experiment.

**Tidy Dataset**:

The final tidy datset which is presented as a txt file, averages the 66 feature variables as per the groups created according to the two label variables. Thus, there are 180 groups (6X30) and there are 66 average quantities for each one of these groups.
  
 - The first column of the tidy dataset is the activity.
 - the second column is the subject.
 - The next 66 columns are the averages of the feature variables for those samples that correspond to these groups.
