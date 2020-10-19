subplot(1,3,1)
fidd = fopen('abalone_pre.data');
x0_0=textscan(fidd ,'%f%f%f%f%f%f%f%f%f');
fclose(fidd);
x1_1=cell2mat(x0_0);
y1a=(x1_1(:,1))';
fid =  fopen('abalone_pre_25.data');
x0=textscan(fid ,'%f%f%f%f%f%f%f%f%f');
fclose(fid);
x1=cell2mat(x0);
y2a=(x1(:,1))';
xxx=linspace(0,4177,4177);
scatter(xxx,y2a,[],'b')
hold on 
scatter(xxx,y1a,[],'r','+')
xlabel('(a)Abalone','fontsize',17)
ylabel('Noise data')
%title('(a)Abalone','fontsize',17)
set(gca,'fontsize',17)



%{
}subplot(1,3,2)
fidd1 = fopen('parkinsons_updrs_pre.data');
x0_01=textscan(fidd1 ,'%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f');
fclose(fidd1);
x1_11=cell2mat(x0_01);
y11=(x1_11(:,1))';
fid1 =  fopen('parkinsons_updrs_pre_25.data');
x01=textscan(fid1 ,'%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f');
fclose(fid1);
x11=cell2mat(x01);
y21=(x11(:,1))';
x13=linspace(0,5875,5875);
scatter(x13,y21,[],'b')
hold on 
scatter(x13,y11,[],'r','+')
xlabel('(b)Parkinsons-updrs','fontsize',17)
ylabel('Noise data')
%title('(b)Parkinsons_updrs','fontsize',17)
set(gca,'fontsize',17)


subplot(1,3,3)
x1_12=xlsread('Real estate valuation data set_pre.xlsx');
y12=(x1_12(:,1))';
x12=xlsread('Real estate valuation data set_pre_50.xlsx');
y22=(x12(:,1))';
x2=linspace(0,414,414);
scatter(x2,y22,[],'b')
hold on 
scatter(x2,y12,[],'r','+')
xlabel('(c)Real estate valuation','fontsize',17)
ylabel('Noise data')
%title('(c)Real estate valuation','fontsize',17)
set(gca,'fontsize',17)
%}
