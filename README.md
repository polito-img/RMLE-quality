# Modeling Subject Scoring Behaviors in Subjective Experiments Based on a Discrete Quality Scale

This software package implements the RMLE (Regularized Maximum Likelihood Estimation) methodology, proposed in: 

[**Modeling Subject Scoring Behaviors in Subjective Experiments Based on a Discrete Quality Scale**](https://doi.org/10.1109/TMM.2024.3382483)

by Lohic Fotio Tiotsop, Antonio Servetti, Marcus Barkowsky, Enrico Masala,  
IEEE Transactions on Multimedia, vol. 26, Mar 2024, pp. 8742-8757, 2024,
DOI: 10.1109/TMM.2024.3382483 ((ISSN: 1520-9210) ([freely available to anyone as open access](https://doi.org/10.1109/TMM.2024.3382483))

RMLE is designed for analyzing subjective experiments conducted using traditional 5-point scales. 
The software estimates the ground truth subjective quality, the subject bias weights, the subject 
overall bias and inconsistency.

The software is provided free of charge, see [LICENSE.txt](./LICENSE.txt) file for further conditions.   
*We kindly ask anyone using this software to cite the previous paper*.

## File Content

1. ```example_of_use.m```
   - Demonstrates how to use RMLE with a sample dataset.
   - Run this script to see the workflow from data input to RMLE output.

2. ```NETFLIX-PUB.mat```
   - A sample dataset provided in MATLAB `.mat` format for testing and demonstration purposes.

3. ```run_RMLE.m```
   - Executes the RMLE optimization process on the dataset and estimate the ground truth quality.
 
4. ```compute_bias_weights.m```
   - Computes the bias weights for each scale  item and each subject. 

5. ```calibrate_beta.m```
   - Compute the parameter beta on which the overall subject inconsistency depends.
   
6. ```get_inconsistency.m```
   - Conpute each subject overall inconsistenvy.

Please send an email to ```lohic.fotiotiotsop@polito.it``` in case of questions.

