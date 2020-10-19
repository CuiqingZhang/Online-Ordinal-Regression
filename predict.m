  function [L,R]=predict(k,y,theta)
 hl=[];
 L=[];
 R=[];
 for il=1:1:k-1%%这里是iL不是1
   if y-theta(1,il)>=0
       hl=[hl,il]; 
   end
 end
 [~,gg]=size(hl);
 if gg==0
     h_left=1;
 else
   h_left=hl(1,gg);%%%左端点，最后一个元素是左端点
 end
  L= [L;h_left];
 hr=[];
 for ir=1:1:k-1
   if y-theta(1,ir)<0
       %f=ir;
       hr=[hr,ir];
   end 
 end
 [s,~]=size(hr);
 if s==0
     h_right=5;
 else
 h_right=hr(1,1);%%%%右端点，第一个元素是右端点
 end
 R=[R; h_right];
