% Take the sign class in return the Result data
function [DataResult] = SignData(SignClass,method)
num = max(size(SignClass));
DataResult = [];
for i = 1:num
    for j = 1:method
        DataResult = [DataResult; SignClass{i}]; %#ok<AGROW>
    end
end
end