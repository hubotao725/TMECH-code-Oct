function arg=InitArg(inputArg,N,caseNum)
%InitArg this function initialize the arg
%inputArg is an empty structure
%arg is a structure

if caseNum==1
    arg=inputArg;
    arg.x0=ones(8*N+1,1);
    arg.lbx=[-5*ones(N,1);
            -inf*ones(N,1);-5*ones(N,1);-inf*ones(N,1);-2*pi*ones(N,1);-inf*ones(2*N,1);-10*ones(N,1);0];
    arg.ubx=[10*ones(N,1);
             inf*ones(N,1);10*ones(N,1);inf*ones(N,1);2*pi*ones(N,1);inf*ones(2*N,1);10*ones(N,1);inf];
    arg.lbg=[zeros(5*(N-1),1);
            1*ones(N,1); 
            zeros(N,1);
            zeros(10,1)];
    arg.ubg=[zeros(5*(N-1),1);
            20*ones(N,1); 
            zeros(N,1);
            zeros(10,1)];
else
    arg=inputArg;
    arg.x0=[zeros(2*N,1);ones(N,1);zeros(N,1);zeros(2*N,1);10.19*ones((N+1)/2,1);-8.81*ones((N-1)/2,1);zeros(N,1);0.65];
    arg.lbx=[-5*ones(N,1);
            -inf*ones(N,1);-5*ones(N,1);-inf*ones(N,1);0*ones(N,1);-inf*ones(2*N,1);-10*ones(N,1);0];
    arg.ubx=[10*ones(N,1);
             inf*ones(N,1);10*ones(N,1);inf*ones(N,1);0*ones(N,1);inf*ones(2*N,1);10*ones(N,1);inf];
    arg.lbg=[zeros(5*(N-1),1);
            1*ones(N,1); 
            zeros(N,1);
            zeros(10,1)];
    arg.ubg=[zeros(5*(N-1),1);
            20*ones(N,1); 
            zeros(N,1);
            zeros(10,1)];
end
%     

      
end
        