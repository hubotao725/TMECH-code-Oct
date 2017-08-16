%this script will solve the optimization problem
%The scripts in this folder are used to solve the optimization problem.
%This one focus on the case of Maximum thrust, minimum thrust and maximum
%thrust
%t3<t1<t2<t4
close all;
clear all;
%x0=[0.0087 0.1604 0.1604 0.2825 0.3496 0.4797 0.4797 0.6283  -.2029 -0.0635 0.0122 0.0030];
%x0=[0.0005 0.1176 0.2777 0.2777 0.4245 0.4245 0.5088 0.6880 1.9223 0.5395 0.2724 0.1626];
 x0=[1 1 1 1  0.01611 0.2611 0.2739 0.3126 0.4867 0.6446];

%optx=[-0.0544   -0.0100   -0.3172   -0.0972    0.0100    0.2547    0.2760
%0.3088    0.4826    0.6447]

N=5;%this is the total switching time
lb=[];
ub=[]; 
%A is N+1x N+5
%x is N+5x 1
%B is N+1x 1
A=[zeros(N,4) eye(N,N) zeros(N,1);
   zeros(1,4) -1 zeros(1,N)];
A(1:N,6:N+5)=A(1:N,6:N+5)-eye(N);

 optx=zeros(1,11);
b=zeros(N+1,1);
%options = optimoptions('fmincon','UseParallel',true);
%[optx,fval]=fmincon(@myfun,x0,A,b,[],[],[],[],@myNonCon);%,options);%,options);
tstart=tic;
[optx,fval]=fmincon(@(x) myfun(x,N),x0,A,b,[],[],[],[],@myNonCon2);
tElapse=toc(tstart);
DrawConstVectorNI(optx);
disp(vpa(fval,6));
disp('total time');
disp(tElapse);
% 
% % 
%    TotalTime=2*optx(6)-2*optx(5);
% %   
% % 
%   c=CalConst(optx);
%   disp(c);
 %DrawConstVector(optx(7:10),optx(6));