clc
clear
%abalone��׼�������ݼ�
k=6;%5+1��K
T=4176;%����ʵ������1
d=7;%7������
fid = fopen('abalone_pre.data');
x0=textscan(fid ,'%f%f%f%f%f%f%f%f%f');
fclose(fid);
x1=cell2mat(x0);
x=(x1(:,[1,2,3,4,5,6,7]))';
yl=x1(:,8);
yr=x1(:,9);
theta=[0,0,0,0,0];%��ֵΪK-1��


%������
%Output��w theta
[A,MAE,theta,L_1] = PA(x,x1,T,k,d,yl,yr,theta);
 L_initial_comp=yl(2:4177,:);
 output1=[MAE,L_initial_comp,L_1,A]
 %xlswrite('result .xlsx',output1)    












