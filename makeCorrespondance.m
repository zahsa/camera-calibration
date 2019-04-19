%******************************************************
%----- Zahra Sadeghi
%----- University of Tehran
%----- Institute for Research in Fundamental Sciences (IPM)
%----- zahra.sadeghi@ut.ac.ir
%----- zahra.sadeghi@ipm.ac.ir
%******************************************************
function [xy_map,XYZ_map]=makeCorrespondance(vw,xyi,XYZw)
if vw==1
    indexArr=[10 16 4 1 61 52 49];
elseif vw==2
    indexArr=[49 17 1 13 16 32 4 52];
elseif vw==3
    indexArr=[61 13 49 52 4 1 16];
elseif vw==4
    indexArr=[49 1 4 16 13 61 17];
elseif vw==5
    indexArr=[49 52 17 4 16 13 61];
elseif vw==6
    indexArr=[49 52 4 16 13 1 61];
elseif vw==7
    indexArr=[13 16 4 49 61 1 17];
elseif vw==8
    indexArr=[49 52 4 13 61 16 17];
elseif vw==9
    indexArr=[49 17 1 61 16 13 64];
elseif vw==10
    indexArr=[49 13 16 4 52 1 17];
end

for i=1:7
    xy_map(i,:)=xyi(indexArr(i),:);
    XYZ_map(i,:)=XYZw(indexArr(i),:);
end