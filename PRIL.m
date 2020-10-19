function  [A,MAE,theta,L1] = PRIL(x,x1,T,k,d,yl,yr,theta)
t=1;%记录每次新添加的数据点
w=zeros(1,d);
MAE=[];
L1=[];
while 1
    yl_t=yl(t);  %第t次的左端点
    yr_t=yr(t);  %第t次的右端点
    x_t=x(:,t);  %第t次的x
    
    if t>T-1   %T为x、yl、yr的行数
        break
    end
    z1=ones(1,yl_t-1);
    z2=-ones(1,k-1-yr_t+1);
    z3=0;
    z=[z1,z3,z2,z3];
    tao=zeros(1,k);
    %I=[1:(yl_t-1);yr_t:k-1]
    for i=1:k
        if z(i)*(w*x_t-theta(i))<=0
            tao(i)=z(i);
        end
    end
    w=w+sum(tao)*x_t';
    theta=theta-tao;
    
    
    x_1=(x1(t+1,1:7))';
    y=w*x_1;
    
    %x_1=(x1(4076:4175,1:7))';
    %w_1=repmat(w,100,1);
    %y_1=w_1*x_1;
    %y=y_1(1,:);
    %[L,R]=predict_1(k,y,theta);%输出区间端点
    %[A,MAE_1,MAE_2]=compare_1(yl,L);
    %MAE_0=1-MAE_2/MAE_1;
    %MAE=[MAE;MAE_0];
    
    % plot(t,MAE_2,'LineWidth',1)
    % hold on
   
    [L,R]=predict_1(k,y,theta);%输出区间端点
    L1=[L1;L];
    [A,MAE_1,MAE_2]=compare_1(yl,L1,t);
    [a,~]=size(A);
    MAE_0=MAE_2/MAE_1;                                                                
    MAE=[MAE;MAE_0]; 
    
    
    t=t+1;
end

