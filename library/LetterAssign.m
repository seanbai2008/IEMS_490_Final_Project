% Take the assigned letter and sample image with sign class and return the cell with assigned letter
function [SampleImg, SignClass] = LetterAssign(Letter, SampleImg, SignClass)
LetterAssign = [];
for i = Letter
    LetterAssign = [LetterAssign,linspace(10*i-9,10*i,10)]; %#ok<AGROW>
end
num = size(LetterAssign,2);
tempSampleImg = {};
tempSignClass = {};
for i = 1:num
    tempSampleImg{i} = SampleImg{LetterAssign(i)};  %#ok<AGROW>
    tempSignClass{i} = SignClass{LetterAssign(i)};  %#ok<AGROW>
end
SampleImg = tempSampleImg;
SignClass = tempSignClass;
end