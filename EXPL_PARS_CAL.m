%******************************************************
%----- Zahra Sadeghi
%----- University of Tehran
%----- Institute for Research in Fundamental Sciences (IPM)
%----- zahra.sadeghi@ut.ac.ir
%----- zahra.sadeghi@ipm.ac.ir
%******************************************************

  xi = xy_map(:,1);
  yi= xy_map(:,2);
  Xw = XYZ_map(:,1);
  Yw = XYZ_map(:,2);
  Zw = XYZ_map(:,3);
for k=1:size(xi)
  A(k,1:8)=[xi(k).*Xw(k) xi(k).*Yw(k) xi(k).*Zw(k) xi(k) -yi(k).*Xw(k) -yi(k).*Yw(k) -yi(k).*Zw(k) -yi(k)];
end
% A
[U, D, V] = svd( A );
estimated_v = V(:,end);

pos_gamma=sqrt( estimated_v(1)^2 + estimated_v(2)^2 + estimated_v(3)^2 );
v=estimated_v /pos_gamma;
% v
alpha=sqrt( v(5)^2 + v(6)^2 + v(7)^2 );


R(2,1:3)=v(1:3);
R(1,1:3)=v(5:7)/alpha;
R(3,1:3)=cross(R(1,:),R(2,:));
 

[U,S,V] = svd(R);
  R = U*V';

 % if zc>0
if (xi.*(R(1,1)*Xw+R(1,2)*Yw+R(1,3)*Zw))>0
    s=-1;
else
    s=+1;
end
% end 
R(2,1:3)=s*R(2,1:3);
R(1,1:3)=s*R(1,1:3);
R(3,1:3)=s*R(3,1:3);
 
Ty=s*v(4);
Tx=s*(v(8)/alpha);

A=[];
A=[xi (R(1,1)*Xw+R(1,2)*Yw+R(1,3)*Zw+Tx*ones(size(xi)))];
b=-xi.*(R(3,1)*Xw+R(3,2)*Yw+R(3,3)*Zw);
ans1=inv(A'*A)*A'*b;


Tz=ans1(1);
fx=ans1(2);
T=[Tx Ty Tz];
fy=fx/alpha;
Beta=asin(R(1,3));
Gama=asin(-R(1,2)/cos(Beta));
alfa=asin(-R(2,3)/cos(Beta));
angle_of_Rot=[alfa,Beta,Gama];
angle_of_Rot
% R
T
fx