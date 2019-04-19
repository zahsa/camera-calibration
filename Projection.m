%******************************************************
%----- Zahra Sadeghi
%----- University of Tehran
%----- Institute for Research in Fundamental Sciences (IPM)
%----- zahra.sadeghi@ut.ac.ir
%----- zahra.sadeghi@ipm.ac.ir
%******************************************************
% function []=Projection
close all
clear all
view_number=1;
[f,rx,ry,rz,Tx,Ty,Tz]=View(view_number);
% f=4.2;
% rx=pi/4;
% ry=0;
% rz=0;
% Tx=2.2;
% Ty=-3.5;
% Tz=1.1;


ox=0;
oy=0;
sx=1;
sy=1;

% 
% cube=zeros(4,4,4,4);
l=1;
for k=1:4
    for i=1:4;
        for j=1:4;
            cube(l,:)=[i j k 1];
            l=l+1;
        end
    end
end
% cube    
sc=size(cube);   
Xw=cube(:,1);
Yw=cube(:,2);
Zw=cube(:,3);


% R=Rotxyz(rx,ry,rz);
R=Rotatation(rx,ry,rz);

T=[Tx Ty Tz];
RT=[R T'];
F = [-f 0 0 ; 0 -f 0;0 0 1 ];

% RT=[R T';0 0 0 1];
% F = [-f 0 0 0; 0 -f 0 0; 0 0 1 0];

S=[sx 0 ox;0 sy oy;0 0 1];

XYZw=[Xw';Yw';Zw';ones(1,sc(1))];
I=S*F*RT*XYZw;

XYZw=XYZw';
XYZw(:,4)=[];

% Xi=I(1,:);
% Yi=I(2,:);
% Zi=I(3,:);

I = I./repmat(I(3,:),[3,1]);

I(3,:)=[];
% Xi=I(1,:);
% Yi=I(2,:);
xyi=I';


%% Plot the projected points
xi = xyi(:,1);
yi = xyi(:,2);
figure
plot(xi,yi,'.')
%% Plot the projected cube
figure
l=1;
while l+3<=sc(1)
    plot(xi(l:l+3),yi(l:l+3),'-*')
    hold on
 l=l+4;
 end

p=1; 
while p<=sc(1) 
 for k=p:p+3
     if k+12<=sc(1)
     plot(xi(k:4:k+12),yi(k:4:k+12),'-*')
     hold on
     end
 end
 p=p+16;
end

p=1; 
while p<=sc(1) 
 for k=p:p+3
%      k
     if k+48<=sc(1)
     plot(xi(k:16:k+48),yi(k:16:k+48),'-*')
     hold on
     end
 end
 p=p+4;
end

plot(xi(1),yi(1),'rs','LineWidth',2,'MarkerEdgeColor','r', 'MarkerFaceColor','r');
plot(xi(4),yi(4),'gs','LineWidth',2,'MarkerEdgeColor','g', 'MarkerFaceColor','g');
plot(xi(13),yi(13),'bs','LineWidth',2,'MarkerEdgeColor','b', 'MarkerFaceColor','b');
plot(xi(16),yi(16),'ys','LineWidth',2,'MarkerEdgeColor','y', 'MarkerFaceColor','y');
plot(xi(49),yi(49),'ms','LineWidth',2,'MarkerEdgeColor','m', 'MarkerFaceColor','m');
plot(xi(52),yi(52),'cs','LineWidth',2,'MarkerEdgeColor','c', 'MarkerFaceColor','c');
plot(xi(64),yi(64),'ks','LineWidth',2,'MarkerEdgeColor','k', 'MarkerFaceColor','k');
plot(xi(32),yi(32),'ks','LineWidth',2,'MarkerEdgeColor','k', 'MarkerFaceColor','y');
plot(xi(17),yi(17),'ks','LineWidth',2,'MarkerEdgeColor','k', 'MarkerFaceColor','c');
plot(xi(61),yi(61),'ks','LineWidth',2,'MarkerEdgeColor','k', 'MarkerFaceColor','m');

%% Make correspondance between image and world coord
[xy_map,XYZ_map]=makeCorrespondance(view_number,xyi,XYZw);