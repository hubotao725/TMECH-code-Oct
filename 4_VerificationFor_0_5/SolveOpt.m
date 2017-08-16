%this script will solve the optimization problem
%The scripts in this folder are used to solve the optimization problem.
%This one focus on the case of Maximum thrust, minimum thrust and maximum
%thrust
%t3<t1<t2<t4
close all;
clear all;

x0=[   -0.0752   -0.0229   -0.1595   -0.0930     .033365 0.6595 0.7672 1.003 1.043 1.094 1.346];

%optx=[ -0.0563   -0.0208   -0.1110   -0.0938    0.0211    0.6634    0.7684
%1.0009    1.0396    1.0924    1.3472]

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