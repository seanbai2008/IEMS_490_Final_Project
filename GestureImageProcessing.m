clear
close all


%% Setting the path and Reading the Images
% Dear Professor and TA, please change this path corresponding to your computer! Thank you!
addpath('C:\Users\sunyue\Desktop\Machine Learning\Project\library')  % path of library
addpath('C:\Users\sunyue\Desktop\Machine Learning\Project\SampleData') % path of image

% Reading the test images
Fimg = imread('F.jpg'); Fimg = imresize(Fimg, 0.25);
Iimg = imread('I.jpg'); Iimg = imresize(Iimg, 0.25);
Jimg = imread('J.jpg'); Jimg = imresize(Jimg, 0.25);
Limg = imread('L.jpg'); Limg = imresize(Limg, 0.25);
Mimg = imread('M.jpg'); Mimg = imresize(Mimg, 0.25);
Nimg = imread('N.jpg'); Nimg = imresize(Nimg, 0.25);
G1img = imread('G1.jpg'); G1img = imresize(G1img, 0.25);
G2img = imread('G2.jpg'); G2img = imresize(G2img, 0.25);
G3img = imread('G3.jpg'); G3img = imresize(G3img, 0.25);
G4img = imread('G4.jpg'); G4img = imresize(G4img, 0.25);
G5img = imread('G5.jpg'); G5img = imresize(G5img, 0.25);
G6img = imread('G6.jpg'); G6img = imresize(G6img, 0.25);

% save the data in a cell for convinence
sampleimg = {Fimg, Iimg, Jimg, Limg, Mimg, Nimg, G1img, G2img, G3img, G4img, G5img, G6img};

% % image showing
% for i = 1 : size(sampleimg,2)
%     figure(i)
%     imshow(sampleimg{i})
% end


%% Preprocessing the image
% The goal of the preprocessing

% Processing a certain image
num = 12;
Img = sampleimg{num};
figure(1)
imshow(Img)
title('Initial Image')
ImgGray= rgb2gray(Img); % Transfer the RGB to Gray
% HSV filter in order to eliminate the back ground
ImgHSV = HSVfilter(Img, [0.6186, 0.6657, 0.1865], [0.3 0.3 0.4]);
% Erosion and Dilation parameters
seD = strel('diamond',3);
se90 = strel('line', 4, 90);
se0 = strel('line', 4, 0);
ImgDi = imdilate(ImgHSV, [se90 se0]); % Dilation for eliminating noise
ImgEr = imerode(ImgDi,seD); % Erosion to get back the shape area
ImgBoundaryEdge = edge(ImgEr,'Prewitt'); % Edge of the boundary
[wristpoint, angle, Orientation] = ExtractHand(ImgBoundaryEdge); % Extract the hand information
[Connectlist] = ConnectPoints(wristpoint); % Connection list based on wrist point
ImgEr = imrotate(ImgEr,Orientation); % rotate the erosion image

[ImgErconnect] = Drawconnection(ImgEr, Connectlist); % Draw the connection on the Erosion image
figure(2)
imshow(ImgErconnect)
title('Wrist Cut')
Imginfo = regionprops(~ImgErconnect); % Extract the information
[area1,are2] = Imginfo.Area; % Access the area information
ImgHand = ~bwareaopen(~ImgErconnect, 2*min([area1,are2])); % small blob elimination

% Rotate the Target region
Irot = imrotate(ImgHand,angle);
Mrot = ~imrotate(true(size(ImgHand)),angle);
Irot(Mrot&~imclearborder(Mrot)) = 255;
ImgHand = Irot; % fill in white
[xmin,xmax,ymin,ymax] = Corpinfo(ImgHand); % the crop coordinate
ImgHand = ImgHand(xmin:xmax,ymin:ymax); % crop the ImgHand
ImgHand = imresize(ImgHand, [380 230]);
Img = imrotate(Img,angle+Orientation); % rotate the RGB image
Img = Img(xmin:xmax,ymin:ymax,1:3); % crop the Img
Img = imresize(Img, [380 230]);
ImgCorner = imrotate(ImgBoundaryEdge,angle+Orientation); % rotate the BoundaryEdge image
ImgCorner = ImgCorner(xmin:xmax,ymin:ymax); % crop the Img
ImgCorner = imresize(ImgCorner, [380 230]);
ImgHand = imdilate(ImgHand, [se90 se0]); % Dilation for eliminating noise
ImgHand = imerode(ImgHand,seD); % Erosion to get back the shape area
ImgBoundaryEdge = edge(ImgHand,'Prewitt'); % Edge of the boundary

% % Noisy Edge
ImgEdge = edge(rgb2gray(Img),'Prewitt',0.03); % Edge detail
ImgEdge = (~imerode(ImgHand,seD) & ImgEdge); % Background subtraction
se90 = strel('line', 2, 90);
se0 = strel('line', 2, 0);
seD = strel('diamond',1);
ImgEdge = imdilate(ImgEdge, [se90 se0]); % Dilation for eliminating noise
ImgEdge = imerode(ImgEdge,seD); % Erosion to get back the shape area
ImgEdge = bwareaopen(ImgEdge, 200); % small blob elimination

figure(3)
imshow(ImgHand)
title('Hand Region Segmentation')

figure(4)
imshow(Img)
title('Initial Image with Rotation and Location Adjustment')

figure(5)
imshow(ImgCorner)
title('Hand Contour')

figure(6)
imshow(ImgEdge)
title('Hand Edge')

figure(8)
ImgHand = imresize(ImgHand, [38 22]);
imshow(ImgHand)
title('Learning Target')

% figure(7)
% C = corner(ImgCorner,500);
% imshow(ImgCorner);
% hold on
% plot(C(:,1), C(:,2), 'r*');
