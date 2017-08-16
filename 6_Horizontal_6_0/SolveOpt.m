%this script will solve the optimization problem
%The scripts in this folder are used to solve the optimization problem.
%This one focus on the case of Maximum thrust, minimum thrust and maximum
%thrust
%t3<t1<t2<t4
close all;
clear all;
  x0=[-0.0526   -0.0631    0.0385   -0.0183  .1478 .5418 .6744 1.09 1.231];

 %optx=[-0.0952   -0.0586   -0.0000   -0.0078    0.1399    0.5442    0.6870
 %1.0913    1.2312]

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