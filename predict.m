  function [L,R]=predict(k,y,theta)
 hl=[];
 L=[];
 R=[];
 for il=1:1:k-1%%������iL����1
   if y-theta(1,il)>=0
       hl=[hl,il]; 
   end
 end
 [~,gg]=size(hl);
 if gg==0
     h_left=1;
 else
   h_left=hl(1,gg);%%%��˵㣬���һ��Ԫ������˵�
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
 h_right=hr(1,1);%%%%�Ҷ˵㣬��һ��Ԫ�����Ҷ˵�
 end
 R=[R; h_right];
