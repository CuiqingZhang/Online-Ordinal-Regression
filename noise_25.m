fid =  fopen('abalone_pre.data');
x0=textscan(fid ,'%f%f%f%f%f%f%f%f%f');
fclose(fid);
x1=cell2mat(x0);
x2=(x1(:,[1,2,3,4,5,6,7]));
x_noise=x2+10*randn(size(x2))+0;
z=round(rand(1,1044)*4176);
for i=1:1:1044
    x2(z(i),:)=x_noise(z(i),:);
end
y=[x2,x1(:,8:9)];
%save('abalone_pre_25.data','y','-ascii');
