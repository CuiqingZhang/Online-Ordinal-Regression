 function [A,MAE,theta,L_1] = PA(x,x1,T,k,d,yl,yr,theta)
t=1;
w=ones(1,d);
%w=ones(1,d);  
C=0.00001;
s=-10;
MAE=[]; 
L_1=[];

%L1、L2 的更新
while 1
    x_t=x(:,t);
    yl_t=yl(t);
    yr_t=yr(t);
    L1=ones(1,yl_t);
    L2=ones(1,k-yr_t);%k-1-yr+1
    if t>T
        break
    end
    for i=1:1:yl_t
        L1(1,i)=max(0,1+theta(1,i)-w*x_t);
        %  L1(1,i)=1+theta1(1,i)-w*x
    end
    
    for j=1:1:k-yr_t
        L2(1,j)=max(0,1+w*x_t-theta(1,yl_t+j));
        %L2(1,j)=1+w*x-theta2(1,j)
    end
    % w thet的更新
    [SL,SR] = SCA(L1,L2,w,x_t,theta,k,yl_t,yr_t,C,s);
    [~,n1]=size(SL);
    [~,n2]=size(SR);
    [dert_theta1,dert_theta2,dert_w]= ramp(SL,SR,w,x_t,theta,yl_t,C,s);
    b=0;
    c=0;
    for i11=1:1:n1
        i_11=SL(:,i11);%索引
        b=b+L1(:,i_11);
    end
    for i22=1:1:n2
        i_22=SR(:,i22);%索引
        c=c+L2(:,i_22-yl_t);
    end
    if b-c==0
        a=0;
    else
    a=(b-c-(n1+n2)*dert_w*x_t+dert_theta1+dert_theta2)\(1+1\2*C+(n1+n2)*((norm(x_t))^2));
    end
    
    w=w+dert_w+(a.*x_t)';
    
    for ii1=1:1:n1
        ii_1=SL(:,ii1);%索引
        t1=w*x_t-theta(:,ii_1);
    if t1<=s
        dert_theta_i1=2*C*(s-t1)*(-1)*(-1);
    else
        dert_theta_i1=0; 
    end
        lambda_i=((L1(:,ii_1)-dert_w*x_t+dert_theta_i1-a*(norm(x_t))^2))\(1+1\2*C);
        if lambda_i<=0 || lambda_i>1000000%==Inf%%%%%%%important
            theta(:,ii_1)=theta(:,ii_1);
        else
           theta(:,ii_1)=theta(:,ii_1)+dert_theta_i1-lambda_i;%只有大于0的那些i的元素才更新
        end
    end
    
    for ii2=1:1:n2
        ii_2=SR(:,ii2);%索引
        t2=theta(:,ii_2)-w*x_t;
    if t2<=s
        dert_theta_i2=2*C*(s-t2)*(-1)*1;
    else
        dert_theta_i2=0;
    end
        mu_j=((L2(:,ii_2-yl_t)+dert_w*x_t-dert_theta_i2+a*(norm(x_t))^2))\(1+1\2*C);
        if mu_j<=0 || mu_j>10000000%==inf%%%%%%%imporant
        theta(:,ii_2)=theta(:,ii_2);
        else
          theta(:,ii_2)=theta(:,ii_2)+dert_theta_i2+mu_j;%只有大于0的那些i的元素才更新
      end 
    end
    x_1=(x1(t+1,1:7))';
    y=w*x_1;
    [L,R]=predict(k,y,theta);%输出区间端点
     L_1=[L_1;L];
    [A,MAE_1,MAE_2]=compare(yl,L_1,t);
    if MAE_1==0
        MAE_0=0;
    else
    MAE_0=MAE_2/MAE_1;
    end
    MAE=[MAE;MAE_0];
     %plot(t,MAE_2,'LineWidth',1)
    % hold on
    t=t+1;
end

















