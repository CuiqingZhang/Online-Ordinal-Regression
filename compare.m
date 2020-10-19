function  [A,MAE_1,MAE_2]=compare(yl,L_1,t)
if t==1
 A=L_1-yl(2,:);
else
L_initial=yl(2:t+1,:);
A=L_1-L_initial;
end
MAE_1=sum(abs(A));
b=A==0;
%c=A==1;
MAE_2=sum(b(:));%+sum(c(:))