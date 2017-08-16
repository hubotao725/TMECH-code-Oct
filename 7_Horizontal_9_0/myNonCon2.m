function [c,ceq]=myNonCon2(optx,N)
%this is for the original setting. maxthrust,minthrust,maxthrust
%t1, t2, t3,t4 are used to control the switch time of the optimization
%problem
%t5 is not that strictly constrained. 

t1=optx(5);
t2=optx(6);
t3=optx(7); 

c1=optx(1);
c2=optx(2);
c3=optx(3);
c4=optx(4);
OMEGA=10;
inity=[0;0;0;0;0;-(1+(20-9.81)*optx(4))/(10)];
[T1,Y1]=ode45(@(t,y) traj4(t,y,optx),[0,t1],inity);

[T2,Y2]=ode45(@(t,y) traj5(t,y,optx),[t1,t2],Y1(end,:));
[T3,Y3]=ode45(@(t,y) traj4(t,y,optx),[t2,t3],Y2(end,:)); 
eq1=10*t1-atan((c2-c1*t1)/(c4-c3*t1));
c=[];
ceq=[Y3(end,1)-9;Y3(end,2);Y3(end,3);Y3(end,4);Y3(end,5);Y1(end,6);Y2(end,6)];

 
function dydt=traj1(t,y,c)
%this is the first part of the trajectory
c1=c(1);
c2=c(2);
c3=c(3);
c4=c(4);
ut=1;
ur=10;
dydt=[y(2);ut*sin(y(5));y(4);ut*cos(y(5))-9.8;ur;(c1*t-c2)*ut*cos(y(5))+(c4-c3*t)*ut*sin(y(5))];

function dydt=traj2(t,y,c)
%this is the first part of the trajectory
c1=c(1);
c2=c(2);
c3=c(3);
c4=c(4);
ut=1;
ur=(c2*c3-c1*c4)/((c1^2+c3^2)*t^2-2*(c1*c2+c3*c4)*t+c2^2+c4^2);
dydt=[y(2);ut*sin(y(5));y(4);ut*cos(y(5))-9.8;ur;(c1*t-c2)*ut*cos(y(5))+(c4-c3*t)*ut*sin(y(5))];

function dydt=traj3(t,y,c)
%this is the first part of the trajectory
c1=c(1);
c2=c(2);
c3=c(3);
c4=c(4);
ut=1;
ur=-10;
dydt=[y(2);ut*sin(y(5));y(4);ut*cos(y(5))-9.8;ur;(c1*t-c2)*ut*cos(y(5))+(c4-c3*t)*ut*sin(y(5))];

function dydt=traj4(t,y,c)
%this is the fifth part of the trajectory
c1=c(1);
c2=c(2);
c3=c(3);
c4=c(4);
ut=20;
ur=10;
dydt=[y(2);ut*sin(y(5));y(4);ut*cos(y(5))-9.8;ur;(c1*t-c2)*ut*cos(y(5))+(c4-c3*t)*ut*sin(y(5))];

function dydt=traj5(t,y,c)
%this is the sixth part of the trajectory
c1=c(1);
c2=c(2);
c3=c(3);
c4=c(4);
ut=20;
ur=(c2*c3-c1*c4)/((c1^2+c3^2)*t^2-2*(c1*c2+c3*c4)*t+c2^2+c4^2);
dydt=[y(2);ut*sin(y(5));y(4);ut*cos(y(5))-9.8;ur;(c1*t-c2)*ut*cos(y(5))+(c4-c3*t)*ut*sin(y(5))];

function dydt=traj6(t,y,c)
%this is the seventh part of the trajectory
c1=c(1);
c2=c(2);
c3=c(3);
c4=c(4);
ut=20;
ur=-10;
dydt=[y(2);ut*sin(y(5));y(4);ut*cos(y(5))-9.8;ur;(c1*t-c2)*ut*cos(y(5))+(c4-c3*t)*ut*sin(y(5))];



