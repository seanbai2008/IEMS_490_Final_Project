% Check the crop boundary and return the bounded in value
function [xmin,xmax,ymin,ymax] = Boundin(xmin,xmax,ymin,ymax,ImgHand)
[x,y] = size(ImgHand);
if xmin <= 0
    xmin = 1;
end
if ymin <= 0
    ymin = 1;
end
if xmax > x
    xmax = x;
end
if ymax > y
    ymax = y;
end
end