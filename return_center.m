%******************************************************
%----- Zahra Sadeghi
%----- University of Tehran
%----- Institute for Research in Fundamental Sciences (IPM)
%----- zahra.sadeghi@ut.ac.ir
%----- zahra.sadeghi@ipm.ac.ir
%******************************************************
function center=return_center(vw,xyi)
if vw==1
    indexArr=[16 13 1 4 4 16 1 13 13 61 1 49];
elseif vw==2
    indexArr=[64 61 49 52 4 16 1 13 52 4 49 1];
elseif vw==3
    indexArr=[13 61 16 64 4 16 1 13 16 13 1 4];
elseif vw==4
    indexArr=[1 4 13 16 1 13 4 16 13 61 1 49];
elseif vw==5
    indexArr=[13 61 1 49 4 1 52 49 1 4 16 13];
elseif vw==6
    indexArr=[4 52 1 49 16 4 1 13 49 52 4 1];
elseif vw==7
    indexArr=[13 16 4 1 49 61 1 13 4 52 16 64];
elseif vw==8
    indexArr=[49 61 1 13 49 52 1 4 13 61 1 49];
elseif vw==9
    indexArr=[49 61 1 13 13 61 1 49 4 1 49 52];
elseif vw==10
    indexArr=[49 52 4 1 4 52 1 49 13 16 61 64];
end
indexArr
center=imageCenter2(xyi,indexArr)
end
