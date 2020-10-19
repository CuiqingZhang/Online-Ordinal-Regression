 function [SL,SR] = SCA(L1,L2,w,x_t,theta,k,yl_t,yr_t,C,s)
if yl_t==1
    SL=[yl_t];
else
    SL=[yl_t-1];
end 
SR=[yr_t];
p=yl_t-2; 
q=yr_t+1;

flag1=1;
while flag1==1 
    
    %%%%%%%%%%%%%%%%%%%求a
    [~,n1]=size(SL);
    [~,n2]=size(SR);
    b=0;
    c=0;%%%%%b和c在循环外和循环里是没有差别的
    [dert_theta1,dert_theta2,dert_w]= ramp(SL,SR,w,x_t,theta,yl_t,C,s);
    for i1=1:1:n1
        i_1=SL(:,i1);%索引
        b=b+L1(:,i_1);
    end
    for i2=1:1:n2
        i_2=SR(:,i2);%索引
        c=c+L2(:,i_2-yl_t);
    end
    a=(b-c-(n1+n2)*dert_w*x_t+dert_theta1+dert_theta2)\(1+1\2*C+(n1+n2)*((norm(x_t))^2));
    
    
    %%%%%%%%%%%%%%%%%%%%%SCA
    if p<=0
        flag1=0;
    elseif L1(1,p)- a*(norm(x_t))^2>0
        %L1(1,p)- ((norm(x_t))^2*(L1(1,p)+b-c))/(1+(norm(x_t))^2*(1+n1+n2))>0
        SL=[p,SL];
        p=p-1;
        flag1=1;
    else
        flag1=0;%p前面的都不再符合
    end
    
    if q>k-1
        flag1=0; 
    elseif L2(1,q-yl_t)-a*(norm(x_t))^2>0
       % L2(1,q-yl_t)-((norm(x_t))^2*(b-L2(1,q-yl_t)-c))/(1+(norm(x_t))^2*(1+n1+n2))>0
        SR=[SR,q];
        flag1=1;
        q=q+1;
    else
        flag1=0;%q后面的都不再符合
    end
end
