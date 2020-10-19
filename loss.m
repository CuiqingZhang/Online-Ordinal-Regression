z=-6:0.01:6;
subplot(1,2,1)
H = @(z)max(0,1-z).^2 ;       %Hinge loss function
plot(z,H(z),'-','linewidth',2);
xlabel('z');
ylabel('Loss');
title('Squared hinge loss','fontweight','normal','fontsize',10);
axis([-6,6 0 3])

subplot(1,2,2)
s=0;
R = @(z)(1.*(z<s)+(max(0,1-z).^2 ).*(z>=s&z<1)+0.*(z>=1));        % ramp loss
plot(z,R(z),'b-','linewidth',2);
xlabel('z');
ylabel('Loss');
title('Squared ramp loss','fontweight','normal','fontsize',10);
axis([-6,6 0 3])

