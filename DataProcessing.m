%% Preface
% Name: Mahdieh Nejati Javaremi     ID: 2834041      Email:m.nejati@u.northwestern.edu
% Name: Yue Sun                     ID: 2880445      Email:sunyue@u.northwestern.edu
% Final Project: Sign Language Recognition with Machine Learning Algorithm
% Description: This .m file is used for data processing
clear
close all


%% Setting the path and Reading the Images
% Dear Professor and TA, please change this path corresponding to your computer! Thank you!
addpath('C:\Users\sunyue\Desktop\Machine Learning\Project\library')  % path of library
addpath('C:\Users\sunyue\Desktop\Machine Learning\Project\Data') % path of image
addpath('C:\Users\sunyue\Desktop\Machine Learning\Project\WorkSpace') % path of image
addpath('C:\Users\sunyue\Desktop\Machine Learning\Project\Dataset') % path of image

% % Read the data and Class
% load('DataSpace10.mat');
% [Data10TrainSpace, Data10TrainResult, Data10TestSpace, Data10TestResult] = SplitTrainTest(DataSpace10, DataResult10, 49, 10);
% 
% load('DataSpace26.mat');
% [Data26TrainSpace, Data26TrainResult, Data26TestSpace, Data26TestResult] = SplitTrainTest(DataSpace26, DataResult26, 21, 26);
% 
% csvwrite('Data10TrainSpace.csv',Data10TrainSpace);
% csvwrite('Data10TrainResult.csv',Data10TrainResult);
% csvwrite('Data10TestSpace.csv',Data10TestSpace);
% csvwrite('Data10TestResult.csv',Data10TestResult);
% 
% csvwrite('Data26TrainSpace.csv',Data26TrainSpace);
% csvwrite('Data26TrainResult.csv',Data26TrainResult);
% csvwrite('Data26TestSpace.csv',Data26TestSpace);
% csvwrite('Data26TestResult.csv',Data26TestResult);

% load('DataSpace12740.mat');
% [Data12740TrainSpace1, Data12740TrainResult1, Data12740TestSpace1, Data12740TestResult1] = SplitTrainTest(DataSpace1, DataResult(1:4900), 49, 10);
% [Data12740TrainSpace2, Data12740TrainResult2, Data12740TestSpace2, Data12740TestResult2] = SplitTrainTest(DataSpace2, DataResult(4901: 2*4900), 49, 10);
% [Data12740TrainSpace3, Data12740TrainResult3, Data12740TestSpace3, Data12740TestResult3] = SplitTrainTest(DataSpace3, DataResult(2*4900+1:end), 49, 6);
% 
% csvwrite('Data12740TrainSpace1.csv',Data12740TrainSpace1);
% csvwrite('Data12740TrainResult1.csv',Data12740TrainResult1);
% csvwrite('Data12740TestSpace1.csv',Data12740TestSpace1);
% csvwrite('Data12740TestResult1.csv',Data12740TestResult1);
% 
% csvwrite('Data12740TrainSpace2.csv',Data12740TrainSpace2);
% csvwrite('Data12740TrainResult2.csv',Data12740TrainResult2);
% csvwrite('Data12740TestSpace2.csv',Data12740TestSpace2);
% csvwrite('Data12740TestResult2.csv',Data12740TestResult2);
% 
% csvwrite('Data12740TrainSpace3.csv',Data12740TrainSpace3);
% csvwrite('Data12740TrainResult3.csv',Data12740TrainResult3);
% csvwrite('Data12740TestSpace3.csv',Data12740TestSpace3);
% csvwrite('Data12740TestResult3.csv',Data12740TestResult3);