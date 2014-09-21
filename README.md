run_analysis.R
R-script for "Human Activity Recognition Using Smartphones Dataset Version 1.0" transformation

Version: 1.0
Author: Rafał Dąbrowski

Description:

The script provided generates file that contains summary - aggregation using mean function  of the  "mean" and "standard deviation" based metrics from the dataset "Human Activity Recognition Using Smartphones Dataset Version 1.0". (http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

Project consist of the following files:
-codebook.md
-readme.md
-run_analysis.R


Prerequisites:
-Script must be placed in the folder of the dataset.
-Script requires 'plyr' R library.

Usage:
-Place the script in the folder where the dataset is located.
-Run the script.
-Result set will be saved in that folder under the 'summary_mean.txt' name.

Acknowledgements:
Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

License:
Use of the run_analysis.R script is licensed under the "Anyone But Richard M Stallman" (ABRMS) license.

Use of the resulting dataset "summary_mean.txt" in publications must be acknowledged by referencing the following publication [1].


[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the author for its use or misuse. Any commercial use is prohibited.