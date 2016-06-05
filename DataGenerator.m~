%% Preface
% Name: Mahdieh Nejati Javaremi     ID: 2834041      Email:m.nejati@u.northwestern.edu
% Name: Yue Sun                     ID: 2880445      Email:sunyue@u.northwestern.edu
% Final Project: Sign Language Recognition with Machine Learning Algorithm
% Description: This .m file is used for trainning data generation
clear
close all


%% Setting the path and Reading the Images
% Dear Professor and TA, please change this path corresponding to your computer! Thank you!
addpath('C:\Users\sunyue\Desktop\Machine Learning\Project\library')  % path of library
addpath('C:\Users\sunyue\Desktop\Machine Learning\Project\Data') % path of image
addpath('C:\Users\sunyue\Desktop\Machine Learning\Project\WorkSpace') % path of image

% % Read the data and Class
% [SampleImg, SignClass] = ReadImageData();
load('ReadingRawData.mat');
DataSpace = [];
% % Letter = [B, E, F, H, J, L, O, V, W, Y]
% Letter = [2, 5, 6, 8, 10, 12, 15, 22, 23, 25];
% [SampleImg, SignClass] = LetterAssign(Letter, SampleImg, SignClass);


%% Preprocessing the image
% The goal of the preprocessing
% Processing a certain image
imgcell = {};
for i = 212:212
    num = i;
    Img = SampleImg{num};
    HSVsample = Img(1:20,1:20,1:3);
    HSVsample = rgb2hsv(HSVsample);
    Filtervalue = mean(mean(HSVsample));
    % HSV filter in order to eliminate the back ground
    ImgHSV = HSVfilter(Img, [Filtervalue(1), Filtervalue(2), Filtervalue(3)], [0.4 0.4 0.3]);
    for j = 2:2 % erosion diameter 1~7
        seD = strel('diamond',j);
        se90 = strel('line', 10, 90);
        se0 = strel('line', 10, 0);
        ImgDi = imdilate(ImgHSV, [se90 se0]); % Dilation for eliminating noise
        ImgDi = bwareaopen(ImgDi, 30);
        ImgEr = imerode(ImgDi,seD); % Erosion to get back the shape area
        ImgEr = imerode(ImgEr,seD); % Erosion to get back the shape area
        ImgBoundaryEdge = edge(ImgEr,'Prewitt'); % Edge of the boundary
        [wristpoint, angle, Orientation] = ExtractHand(ImgBoundaryEdge); % Extract the hand information
        [Connectlist] = ConnectPoints(wristpoint); % Connection list based on wrist point
        ImgEr = imrotate(ImgEr,Orientation); % rotate the erosion image    
        [ImgErconnect] = Drawconnection(ImgEr, Connectlist); % Draw the connection on the Erosion image
        Imginfo = regionprops(~ImgErconnect); % Extract the information
        blobnum = size(Imginfo,1);
        temparea = [];
        for ii = 1:blobnum
            temparea = [temparea;Imginfo(ii).Area]; %#ok<AGROW>
        end
        if size(Imginfo,1)~=1
            temparea = sort(temparea);
            ImgHand = ~bwareaopen(~ImgErconnect, round(1.2*temparea(end-1))); % small blob elimination
        else
            ImgHand = ImgErconnect;
        end
        
        % Rotate the Target region
        for k = 1:7   % [-6 -4 -2 0 2 4 6]
            Irot = imrotate(ImgHand,angle + (2*k-8));
            Mrot = ~imrotate(true(size(ImgHand)),angle + (2*k-8));
            Irot(Mrot&~imclearborder(Mrot)) = 255;
            ImgTarget = Irot; % fill in white
            [xmin,xmax,ymin,ymax] = Corpinfo(ImgTarget); % the crop coordinate
            [xmin,xmax,ymin,ymax] = Boundin(xmin,xmax,ymin,ymax,ImgTarget); % Bound in the crop coordinate
            ImgTarget = ImgTarget(abs(xmin)+1:abs(xmax),abs(ymin):abs(ymax)); % crop the ImgHand
            ImgTarget = imresize(ImgTarget, [380 230]);
            imgcell{k} = ImgTarget; %#ok<SAGROW>
            imshow(ImgTarget)
            ImgTarget = imresize(ImgTarget, [38 23]);            
            DataSpace = [DataSpace; transpose(ImgTarget(:))]; %#ok<AGROW>
        end
    end
    fprintf('\nData Generation Finished %4.2f\n',i/2.6);
end

% csvwrite('SignLanguageData2.csv',DataSpace);
