% Take the whole space and result in and return the test and train split
function [TrainSpace, TrainResult, TestSpace, TestResult] = SplitTrainTest(DataSpace, DataResult, method, letternum)
TrainSpace = [];
TrainResult = [];
TestSpace = [];
TestResult = [];
for i = 1:letternum
    tempTestSpace1 = DataSpace(10*method*(i-1)+1:10*method*(i-1)+method,:);
    tempTestSpace2 = DataSpace(10*method*(i)-method+1:10*method*i,:);
    tempTrainSpace = DataSpace(10*method*(i-1)+method+1:10*method*i-method,:);
    tempTestResult1 = DataResult(10*method*(i-1)+1:10*method*(i-1)+method);
    tempTestResult2 = DataResult(10*method*(i)-method+1:10*method*i);
    tempTrainResult = DataResult(10*method*(i-1)+method+1:10*method*i-method);
    
    TrainSpace = [TrainSpace; tempTrainSpace]; %#ok<AGROW>
    TrainResult = [TrainResult; tempTrainResult]; %#ok<AGROW>
    TestSpace = [TestSpace; tempTestSpace1; tempTestSpace2]; %#ok<AGROW>
    TestResult = [TestResult; tempTestResult1; tempTestResult2]; %#ok<AGROW>
    
end
end