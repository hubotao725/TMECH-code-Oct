%this script will solve the optimization problem
%The scripts in this folder are used to solve the optimization problem.
%This one focus on the case of Maximum thrust, minimum thrust and maximum
%thrust
%t3<t1<t2<t4
close all;
clear all;
x0=[1 1 1 1  .1573 .3191 .5797 .7505 .8988];

%optx=[-0.1318   -0.0592    0.0000   -0.0039    0.1474    0.3135    0.5852    0.7513    0.8987]

N=4;%this is the total switching time
lb=[];
ub=[]; 
%A is N+1x N+5
%x is N+5x 1
%B is N+1x 1
A=[zeros(N,4) eye(N,N) zeros(N,1);
   zeros(1,4) -1 zeros(1,N)];
A(1:N,6:N+5)=A(1:N,6:N+5)-eye(N);
 
b=zeros(N+1,1);
%options = optimoptions('fmincon','UseParallel',true);
%[optx,fval]=fmincon(@myfun,x0,A,b,[],[],[],[],@myNonCon);%,options);%,options);
tstart=tic;
[optx,fval]=fmincon(@(x) myfun(x,N),x0,A,b,[],[],[],[],@myNonCon2);
tElapse=toc(tstart);
DrawConstVectorNI(optx);
disp(vpa(fval,6));
disp('Elapsed time');
disp(tElapse);
% 
% % 
%    TotalTime=2*optx(6)-2*optx(5);
% %   
% % 
%   c=CalConst(optx);
%   disp(c);
 %DrawConstVector(optx(7:10),optx(6));