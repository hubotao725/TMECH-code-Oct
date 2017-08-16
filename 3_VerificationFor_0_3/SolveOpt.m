%this script will solve the optimization problem
%The scripts in this folder are used to solve the optimization problem.
%This one focus on the case of Maximum thrust, minimum thrust and maximum
%thrust
%t3<t1<t2<t4
close all;
clear all; 
 x0=[ -0.0544   -0.0100   -0.3172   -0.0972    .03253 0.4933 0.5855 0.8132 0.8294 0.8511 1.084];
%xopt=[-0.0752   -0.0229   -0.1595   -0.0930    0.0232    0.4953    0.5787
%0.8131    0.8301    0.8511    1.0848]
 

N=6;%this is the total switching time
lb=[];
ub=[]; 
%A is N+1x N+5
%x is N+5x 1
%B is N+1x 1
A=[zeros(N,4) eye(N,N) zeros(N,1);
   zeros(1,4) -1 zeros(1,N)];
A(1:N,6:N+5)=A(1:N,6:N+5)-eye(N);
 
b=zeros(N+1,1); 
tstart=tic;
[optx,fval]=fmincon(@(x) myfun(x,N),x0,A,b,[],[],[],[],@myNonCon2);
tElapse=toc(tstart);
DrawConstVectorNI(optx);
 disp(vpa(fval,6));
 disp('total time');
disp(tElapse);
% 