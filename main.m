clc
clear
%abalone标准化后数据集
k=6;%5+1个K
T=4176;%比真实数据少1
d=7;%7个属性
fid = fopen('abalone_pre.data');
x0=textscan(fid ,'%f%f%f%f%f%f%f%f%f');
fclose(fid);
x1=cell2mat(x0);
x=(x1(:,[1,2,3,4,5,6,7]))';
yl=x1(:,8);
yr=x1(:,9);
theta=[0,0,0,0,0];%阈值为K-1个


%主函数
%Output：w theta
[A,MAE,theta,L_1] = PA(x,x1,T,k,d,yl,yr,theta);
 L_initial_comp=yl(2:4177,:);
 output1=[MAE,L_initial_comp,L_1,A]
 %xlswrite('result .xlsx',output1)    












