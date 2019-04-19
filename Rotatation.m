%******************************************************
%----- Zahra Sadeghi
%----- University of Tehran
%----- Institute for Research in Fundamental Sciences (IPM)
%----- zahra.sadeghi@ut.ac.ir
%----- zahra.sadeghi@ipm.ac.ir
%******************************************************
function R=Rotatation(alpha,beta,gamma)
% R1=[1 0 0;0 cos(alpha) -sin(alpha);0 sin(alpha) cos(alpha)];
% R2=[cos(beta) 0 -sin(beta);0 1 0;sin(beta) 0 cos(beta)];
% R3=[cos(gamma) -sin(gamma) 0;sin(gamma) cos(gamma) 0;0 0 1];
% 
% R=R1.*R2.*R3;

R=[cos(beta)*cos(gamma) -cos(beta)*sin(gamma) sin(beta);...
  sin(alpha)*sin(beta)*cos(gamma)+cos(alpha)*sin(gamma) -sin(alpha)*sin(beta)*sin(gamma)+cos(alpha)*cos(gamma) -sin(alpha)*cos(beta);...
  -cos(alpha)*sin(beta)*cos(gamma)+sin(alpha)*sin(gamma) cos(alpha)*sin(beta)*sin(gamma)+sin(alpha)*cos(gamma) cos(alpha)*cos(gamma)];