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

 
  o = ones( size(xi) );
  z = zeros( size(xi) );
  A=[Xw Yw Zw o z z z z -xi.*Xw -xi.*Yw -xi.*Zw -xi;z z z z Xw Yw Zw o -yi.*Xw -yi.*Yw -yi.*Zw -yi];
% A=[size(xi),12];
% for k=1:size(xi)
%     if mod(k,2)~=0
%        A(k,1:12)=[Xw(k) Yw(k) Zw(k) 1 0 0 0 0 -xi(k)*Xw(k) -xi(k)*Yw(k) -xi(k)*Zw(k) -xi(k)]
%     else
%        A(k,1:12)=[0 0 0 0 Xw(k) Yw(k) Zw(k) 1 -yi(k)*Xw(k) -yi(k)*Yw(k) -yi(k)*Zw(k) -yi(k)];
%     end
% end
       
[U, D, V] = svd( A );
  m = V(:,end);
  M = reshape(m,4,3)';
  
  gamma = sqrt( M(3,1)^2 + M(3,2)^2 + M(3,3)^2 );
  M = M / gamma;
  if Tz>0
    s = sign(M(3,4));
  else
    s = -sign(M(3,4));
  end
  Tz=s*M(3,4);
  R(3,1)=s*M(3,1);
  R(3,2)=s*M(3,2);
  R(3,3)=s*M(3,3);
  q1=[M(1,1) M(1,2) M(1,3)]';
  q2=[M(2,1) M(2,2) M(2,3)]';
  q3=[M(3,1) M(3,2) M(3,3)]';
  ox=q1'*q3;
  oy=q2'*q3;
  fx = sqrt( q1'*q1 - ox^2 );
  fy = sqrt( q2'*q2 - oy^2 );
  
%   f=fx/sx;
%   f=fx/sy;
  R(1,:) = s*(ox*M(3,1:3) - M(1,1:3) ) / fx;
  R(2,:) = s*(oy*M(3,1:3) - M(2,1:3) ) / fy;
  Tx = s*(ox*M(3,4) - M(1,4) ) / fx;
  Ty = s*(oy*M(3,4) - M(2,4) ) / fy;
  T = [Tx;Ty;Tz];
  [U,S,V] = svd(R);
  R = U*V';
  
  M = [
      -fx*R(1,1)+ox*R(3,1) -fx*R(1,2)+ox*R(3,2) -fx*R(1,3)+ox*R(3,3) -fx*T(1)+ox*T(3);
      -fy*R(2,1)+oy*R(3,1) -fy*R(2,2)+oy*R(3,2) -fy*R(2,3)+oy*R(3,3) -fy*T(2)+oy*T(3);
      R(3,1)               R(3,2)               R(3,3)               T(3)
      ];
  
  fy=fx/alpha;
Beta=double(asin(R(1,3)));
Gama=double(asin(-R(1,2)/cos(Beta)));
alfa=double(asin(-R(2,3)/cos(Beta)));
angle_of_Rot=[alfa,Beta,Gama];

  R
  angle_of_Rot
  T'
  fx