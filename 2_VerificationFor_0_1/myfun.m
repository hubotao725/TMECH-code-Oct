function f=myfun(x,N)
%myfun this function is the objective function
%x is the input. There are four elements in the x.
%x1=t1,x2=t2,x3=t3,x4=t4.
%t1 is the switch time for the thrust(from maximum to minimum)
%t2 is the switch time for the thrust(from minimum to maximum)
%t3 is the switch time for the rotation(from maximum to minimum)
%t4 is the switch time for the rotation(from minimum to maximum)
OMEGA=10;
f=x(N+5);
end
