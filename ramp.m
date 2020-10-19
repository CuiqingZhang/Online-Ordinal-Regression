function[dert_theta1,dert_theta2,dert_w]= ramp(SL,SR,w,x_t,theta,yl_t,C,s)
LS1=[];
LS2=[];
for i =1:1:(size(SL))
    ii=SL(:,i);
    t1=w*x_t-theta(:,ii);
    if t1<=s
        ls1=2*(s-t1)*(-1);
    else
        ls1=0; 
    end
    LS1=[LS1,ls1];
end

for j =1:1:(size(SR))
    jj=SR(:,j);
    t2=theta(:,jj)-w*x_t;
    if t2<=s
        ls2=2*(s-t2)*(-1);
    else
        ls2=0;
    end
    LS2=[LS2,ls2];
end
dert_w=(C*sum(LS1)*x_t+C*sum(LS2)*(-x_t))';
dert_theta1=C*sum(LS1.*(-1));
dert_theta2=C*sum(LS2.*1);
