%******************************************************
%----- Zahra Sadeghi
%----- University of Tehran
%----- Institute for Research in Fundamental Sciences (IPM)
%----- zahra.sadeghi@ut.ac.ir
%----- zahra.sadeghi@ipm.ac.ir
%******************************************************
function center=imageCenter2(xyi,indexArr)
% xyi=xyi/xyi(3);
center=[];
xi = xyi(:,1);
yi = xyi(:,2);

% plot(xi,yi,'*')
% hold on

c1=getSlopeCoef(xi(indexArr(1)),yi(indexArr(1)),xi(indexArr(2)),yi(indexArr(2)));
c2=getSlopeCoef(xi(indexArr(3)),yi(indexArr(3)),xi(indexArr(4)),yi(indexArr(4)));
vp1=cross(c1,c2);


c1=getSlopeCoef(xi(indexArr(5)),yi(indexArr(5)),xi(indexArr(6)),yi(indexArr(6)));
c2=getSlopeCoef(xi(indexArr(7)),yi(indexArr(7)),xi(indexArr(8)),yi(indexArr(8)));
vp2=cross(c1,c2);

c1=getSlopeCoef(xi(indexArr(9)),yi(indexArr(9)),xi(indexArr(10)),yi(indexArr(10)));
c2=getSlopeCoef(xi(indexArr(11)),yi(indexArr(11)),xi(indexArr(12)),yi(indexArr(12)));
vp3=cross(c1,c2);

vp1
vp2
vp3

vp1=vp1/vp1(3);
vp2=vp2/vp2(3);
vp3=vp3/vp3(3);

vp1
vp2
vp3

vp=[vp1;vp2;vp3;vp1];
figure
plot(vp(:,1),vp(:,2),'-*')
hold on
% figure
plot(vp1(1),vp1(2),'rs')
hold on
plot(vp2(1),vp2(2),'bs')
hold on
plot(vp3(1),vp3(2),'ys')


% figure
%         p=[xyi(1,:);xyi(5,:);xyi(2,:);xyi(6,:);];
%         plot(p(:,1),p(:,2),'r-*','MarkerSize',15, 'LineWidth', 2);
%         hold on
%         p=[xyi(4,:);xyi(20,:);xyi(8,:);xyi(25,:);];
%         plot(p(:,1),p(:,2),'b-*','MarkerSize',15, 'LineWidth', 2);

vpc1=getOrthoCoef(vp1(1),vp1(2),vp2(1),vp2(2),vp3(1),vp3(2));
vpc2=getOrthoCoef(vp2(1),vp2(2),vp3(1),vp3(2),vp1(1),vp1(2));
% % vpc1=vpc1/vpc1(3);
% % vpc2=vpc2/vpc2(3);
vpc1
vpc2
center=cross(vpc1,vpc2);
center
center=center/center(3);
center(3)=[];
center
plot(center(1),center(2),'r*')

% vpc11=getOrthoCoef(vp11(1),vp11(2),vp22(1),vp22(2),vp33(1),vp33(2));
% vpc22=getOrthoCoef(vp11(1),vp11(2),vp33(1),vp33(2),vp22(1),vp22(2));
% center2=cross(vpc11,vpc22);
% center2
% center2=center2/center2(3);
% center2(3)=[];
% center2
end

function co=getSlopeCoef(x1,y1,x2,y2)
vert=0;
horiz=0;
s1=y2-y1;
s2=x2-x1;
if s1==0
    horiz=1;%%y=y1
elseif s2==0
    vert=1;%%x=x1
else
    m=s1/s2;
end

if vert==1
    a=1;
    b=0;
    c=-x1;
elseif horiz==1
    a=0;
    b=1;
    c=-y1;
else
    a=-m;
    b=1;
    c=m*x1-y1;
end

co=[a,b,c];
end


function co=getOrthoCoef(x1,y1,x2,y2,x3,y3)
vert=0;
horiz=0;
s1=y2-y1;
s2=x2-x1;
if s1==0
    horiz=1;%%y=y1
elseif s2==0
    vert=1;%%x=x1
else
    m=s1/s2;
end

if horiz==1
    a=1;
    b=0;
    c=-x3;
elseif vert==1 
    a=0;
    b=1;
    c=-y3;
else
    a=1/m;
    b=1;
    c=(-1/m)*x3-y3;

end

co=[a,b,c];

end