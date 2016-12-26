# Code Book

## Tidy data "tidy_average_mean_and_std.txt" description.

### Only variables with the words means and std were kept.  Case was ignored.
- mean: mean value
- std: standard deviation value

### Activity names were added to make the activity more readable.  Below is a list of activities.
1.  WALKING for activity_id 1 - subect was walking 
2.  WALKING_UPSTAIRS for activity_id 2 - subject was walking up the stairs
3.  WALKING_DOWNSTAIRS for activity_id 3  - subject was walking down the stairs
4.  SITTING for activity_id 4 - subject was sitting
5.  STANDING for activity_id 5 - subject was standing
6.  LAYING for activity_id 6 - subject was laying down

### The tidy data has the following attributes:
1.  180 rows or observations depicting the average of the mean and standard deviation aggregated by activity and subject.
2.  89 columns or variables including the subject_id, activity_id and activity_name.  The angle features were also included as they contained the word Mean (with a capital M.)

###  Below is a list of the variables names tidy'd up by capitalizing Mean and Std.  Periods were also removed.  Note that read.table replace the characters "(", ")" and "-" with a period "." due to column naming constraints.

#### Factors:
1.  subject_id - subject or volunteers between 1 and 30. No names have been associated to each subject,
2.  activity_id - the activity_id
3.  activity_name - name associated to each activity.

#### Measurements from the gyroscope, accelerometer, etc. of the smart phone:
4.  tBodyAccMeanX
5.  tBodyAccMeanY
6.  tBodyAccMeanZ
7.  tBodyAccStdX
8.  tBodyAccStdY
9.  tBodyAccStdZ
10. tGravityAccMeanX
11. tGraityAccMeanY
12. tGravityAccMeanZ
13. tGravityAccStdX
14. tGravityAccStdY
15. tGravityAccStdZ
16. tBodyAccJerkMeanX
17. tBodyAccJerkMeanY
18. tBodyAccJerkMeanZ
19. tBodyAccJerkStdX
20. tBodyAccJerkStdY
21. tBodyAccJerkStdZ
22. tBodyGyroMeanX
23. tBodyGyroMeanY
24. tBodyGyroMeanZ
25. tBodyGyroStdX
26. tBodyGyroStdY
27. tBodyGyroStdZ
28. tBodyGyroJerkMeanX
29. tBodyGyroJerkMeanY
30. tBodyGyroJerkMeanZ
31. tBodyGyroJerkStdX
32. tBodyGyroJerkStdY
33. tBodyGyroJerkStdZ
34. tBodyAccMagMean
35. tBodyAccMagStd
36. tGravityAccMagMean
37. tGravityAccMagStd
38. tBodyAccJerkMagMean
39. tBodyAccJerkMagStd
40. tBodyGyroMagMean
41. tBodyGyroMagStd
42. tBodyGyroJerkMagMean
43. tBodyGyroJerkMagStd
44. fBodyAccMeanX
45. fBodyAccMeanY
46. fBodyAccMeanZ
47. fBodyAccStdX
48. fBodyAccStdY
49. fBodyAccStdZ
50. fBodyAccMeanFreqX
51. fBodyAccMeanFreqY
52. fBodyAccMeanFreqZ
53. fBodyAccJerkMeanX
54. fBodyAccJerkMeanY
55. fBodyAccJerkMeanZ
56. fBodyAccJerkStdX
57. fBodyAccJerkStdY
58. fBodyAccJerkStdZ
59. fBodyAccJerkMeanFreqX
60. fBodyAccJerkMeanFreqY
61. fBodyAccJerkMeanFreqZ
62. fBodyGyroMeanX
63. fBodyGyroMeanY
64. fBodyGyroMeanZ
65. fBodyGyroStdX
66. fBodyGyroStdY
67. fBodyGyroStdZ
68. fBodyGyroMeanFreqX
69. fBodyGyroMeanFreqY
70. BodyGyroMeanFreqZ
71. fBodyAccMagMean
72. fBodyAccMagStd
73. fBodyAccMagMeanFreq
74. fBodyBodyAccJerkMagMean
75. fBodyBodyAccJerkMagStd
76. fBodyBodyAccJerkMagMeanFreq
77. fBodyBodyGyroMagMean
78. fBodyBodyGyroMagStd
79. fBodyBodyGyroMagMeanFreq
80. fBodyBodyGyroJerkMagMean
81. fBodyBodyGyroJerkMagStd
82. fBodyBodyGyroJerkMagMeanFreq
83. angletBodyAccMeanGravity
84. angletBodyAccJerkMeanGravityMean
85. angletBodyGyroMeanGravityMean
86. angletBodyGyroJerkMeanGravityMean
87. angleXGravityMean
88. angleYGravityMean
89. angleZGravityMean

