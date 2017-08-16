function DrawConstVectorNI(optx)
%DrawConstVector this function draws plot based on the constant vector c
%this program will test the possibility of giving initial constant vector
%to determine the final state.
t1=optx(5);
t2=optx(6);
t3=optx(7);
t4=optx(8);
t5=optx(9); 
 
c1=optx(1);
c2=optx(2);
c3=optx(3);
c4=optx(4);
MINTHRUST=1;
MAXTHRUST=20;
GRAVITY=9.81;
ROTATIONSPEED=10;
 
inity=[0;0;0;0;0;-(1+(20-9.81)*optx(4))/(10)];
[T1,Y1]=ode45(@(t,y) traj4(t,y,optx),[0,t1],inity);

[T2,Y2]=ode45(@(t,y) traj5(t,y,optx),[t1,t2],Y1(end,:));
[T3,Y3]=ode45(@(t,y) traj6(t,y,optx),[t2,t3],Y2(end,:));
[T4,Y4]=ode45(@(t,y) traj5(t,y,optx),[t3,t4],Y3(end,:));
[T5,Y5]=ode45(@(t,y) traj4(t,y,optx),[t4,t5],Y4(end,:));  
YRes=[Y1;Y2;Y3;Y4;Y5];
figure(1);
plot(YRes(:,1),YRes(:,3));
T=[T1;T2;T3;T4;T5];
figure(2);
plot(T(:),YRes(:,6));
h=figure(3);
LineWidth=1.5;
IMG_WIDTH=9;
IMG_HEIGHT=5;
FontSize=7;
hold on;
plot(T(:),YRes(:,6),'m','LineWidth',LineWidth);
plot(T(:),(optx(2)-optx(1)*T(:)).*sin(YRes(:,5))+(optx(4)-optx(3)*T(:)).*cos(YRes(:,5)),'b','LineWidth',LineWidth);
hold off;
xlabel('Time (s)');
ylabel('Switching curve');
title('Switching curve of the control input u_1 and u_2');
set(h,'paperunits','centimeters');
set(h,'papersize',[IMG_WIDTH IMG_HEIGHT]);
set(h,'paperposition',[0,0,IMG_WIDTH,IMG_HEIGHT]);
 
legend('\phi_R','\phi_T');
set(gca,'FontSize',FontSize);
print -dpdf switchingcurve.pdf

function dydt=traj1(t,y,c)
%this is the first part of the trajectory
c1=c(1);
c2=c(2);
c3=c(3);
c4=c(4);
ut=1;
ur=10;
dydt=[y(2);ut*sin(y(5));y(4);ut*cos(y(5))-9.81;ur;(c1*t-c2)*ut*cos(y(5))+(c4-c3*t)*ut*sin(y(5))];

function dydt=traj2(t,y,c)
%this is the first part of the trajectory
c1=c(1);
c2=c(2);
c3=c(3);
c4=c(4);
ut=1;
ur=(c2*c3-c1*c4)/((c1^2+c3^2)*t^2-2*(c1*c2+c3*c4)*t+c2^2+c4^2);
dydt=[y(2);ut*sin(y(5));y(4);ut*cos(y(5))-9.81;ur;(c1*t-c2)*ut*cos(y(5))+(c4-c3*t)*ut*sin(y(5))];

function dydt=traj3(t,y,c)
%this is the first part of the trajectory
c1=c(1);
c2=c(2);
c3=c(3);
c4=c(4);
ut=1;
ur=-10;
dydt=[y(2);ut*sin(y(5));y(4);ut*cos(y(5))-9.81;ur;(c1*t-c2)*ut*cos(y(5))+(c4-c3*t)*ut*sin(y(5))];

function dydt=traj4(t,y,c)
%this is the fifth part of the trajectory
c1=c(1);
c2=c(2);
c3=c(3);
c4=c(4);
ut=20;
ur=10;
dydt=[y(2);ut*sin(y(5));y(4);ut*cos(y(5))-9.81;ur;(c1*t-c2)*ut*cos(y(5))+(c4-c3*t)*ut*sin(y(5))];

function dydt=traj5(t,y,c)
%this is the sixth part of the trajectory
c1=c(1);
c2=c(2);
c3=c(3);
c4=c(4);
ut=20;
ur=(c2*c3-c1*c4)/((c1^2+c3^2)*t^2-2*(c1*c2+c3*c4)*t+c2^2+c4^2);
dydt=[y(2);ut*sin(y(5));y(4);ut*cos(y(5))-9.81;ur;(c1*t-c2)*ut*cos(y(5))+(c4-c3*t)*ut*sin(y(5))];

function dydt=traj6(t,y,c)
%this is the seventh part of the trajectory
c1=c(1);
c2=c(2);
c3=c(3);
c4=c(4);
ut=20;
ur=-10;
dydt=[y(2);ut*sin(y(5));y(4);ut*cos(y(5))-9.81;ur;(c1*t-c2)*ut*cos(y(5))+(c4-c3*t)*ut*sin(y(5))];

