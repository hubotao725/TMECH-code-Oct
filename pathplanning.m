%Path following solver
clear all;
close all;
addpath('G:\Downloads\casadi-matlabR2014a-v2.4.1-Debug');
addpath('C:\Users\hubot\Downloads\casadi-matlabR2014a-v2.4.1-Debug');
import casadi.*

N=201;
b=SX.sym('b',8*N+1,1);
s=SX.sym('s',N,1);
maxS=1;

finalPos=[0 1];%this is the final position
[f]=CostFun(b,N);

[y,z,theta]=GetDerivative(b,N);

g=ConstrFun(y,z,theta,b,N,finalPos);

nlp=SXFunction('nlp',nlpIn('x',b),nlpOut('f',f,'g',g));
solver=NlpSolver('solver','ipopt',nlp);

arg=struct;
arg=InitArg(arg,N,0);
tstart=tic();
res=solver(arg);
tstop=toc(tstart);
disp(tstop);
f_opt=full(res.f);
x_opt=full(res.x);
lam_x_opt=full(res.lam_x);
lam_g_opt=full(res.lam_g);
%[F_T,F_W]=GetInput(x_opt,N);
[pltY2,pltZ2,pltTheta2]=GetQuadState(y,z,theta,b,x_opt);
%  h=figure(1);
%  
% LineWidth=1.5;
% IMG_WIDTH=9;
% IMG_HEIGHT=5;
% FontSize=7;
% step=1;
% Ts=f_opt/(N-1);
% F_t=full(res.g(5*N-4:6*N-5));
% plot(Ts*(1:step:N),F_t(1:N));
% xlabel('Time (s)');
% ylabel('Control input (N/kg)');
% title('Control input u_1 with respect to time');
% set(h,'paperunits','centimeters');
% set(h,'papersize',[IMG_WIDTH IMG_HEIGHT]);
% set(h,'paperposition',[0,0,IMG_WIDTH,IMG_HEIGHT]);
% xlim([0 5]);
% ylim([0 5]);
% set(gca,'FontSize',FontSize);
% % print -dpdf maneuver.pdf
% h=figure(3); 
% 
% LineWidth=1.5;
% IMG_WIDTH=7;
% IMG_HEIGHT=5;
% FontSize=9;
% step=1;
% Ts=f_opt/(N-1);
% F_t=full(res.g(5*N-4:6*N-5));
% set(h,'paperunits','centimeters');
% set(h,'papersize',[IMG_WIDTH IMG_HEIGHT]);
% set(h,'paperposition',[0,0,IMG_WIDTH,IMG_HEIGHT]);
% plot(Ts*(1:step:N),F_t(1:N),'r','LineWidth',LineWidth); 
% xlabel('Time (s)');
% ylabel('Control input (N/kg)');
% title('Normalized thrust');
%  
% xlim([0 (N-1)*Ts]);
% ylim([0 21]);
% set(gca,'FontSize',FontSize);
% print -dpdf thrustinput.pdf
% print -djpeg thrustinput.jpg
% figure(4);
% plot(pltY(1:N,1),pltZ(1:N,1));
% title('thrust  time optimal');
% figure(5);
% plot(1:N,pltTheta(1:N));
 


addpath('G:\Downloads\casadi-matlabR2014a-v2.4.1-Debug');
addpath('C:\Users\hubot\Downloads\casadi-matlabR2014a-v2.4.1-Debug');
import casadi.*

N=201;
b=SX.sym('b',8*N+1,1);
s=SX.sym('s',N,1);
maxS=1;

finalPos=[0 1];%this is the final position
[f]=CostFun(b,N);

[y,z,theta]=GetDerivative(b,N);

g=ConstrFun(y,z,theta,b,N,finalPos);

nlp=SXFunction('nlp',nlpIn('x',b),nlpOut('f',f,'g',g));
solver=NlpSolver('solver','ipopt',nlp);

arg=struct;
arg=InitArg(arg,N,1);
tstart=tic();
res=solver(arg);
tstop=toc(tstart);
disp(tstop);
f_opt=full(res.f);
x_opt=full(res.x);
lam_x_opt=full(res.lam_x);
lam_g_opt=full(res.lam_g);
%[F_T,F_W]=GetInput(x_opt,N);
 [pltY,pltZ,pltTheta]=GetQuadState(y,z,theta,b,x_opt);
 

h=figure(3); 

LineWidth=1.5;
IMG_WIDTH=7;
IMG_HEIGHT=5;
FontSize=7;
step=1;
Ts=f_opt/(N-1);
F_t=full(res.g(5*N-4:6*N-5));
set(h,'paperunits','centimeters');
set(h,'papersize',[IMG_WIDTH IMG_HEIGHT]);
set(h,'paperposition',[0,0,IMG_WIDTH,IMG_HEIGHT]);

plot(Ts*(1:step:N),pltTheta(1:N,2),'r','LineWidth',LineWidth); 
xlabel('Time (s)');
ylabel('Control input (N/kg)');
title('Normalized thrust');
 
xlim([0 (N-1)*Ts]);
ylim([-10 10]);
set(gca,'FontSize',FontSize);
print -dpdf thrustinput.pdf
print -djpeg thrustinput.jpg
h=figure(6);

LineWidth=1.5;
IMG_WIDTH=7;
IMG_HEIGHT=5;
FontSize=7; 
set(h,'paperunits','centimeters');
set(h,'papersize',[IMG_WIDTH IMG_HEIGHT]);
set(h,'paperposition',[0,0,IMG_WIDTH,IMG_HEIGHT]);
hold on;
Ts=f_opt/(N-1);
LineWidth=1.5;
IMG_WIDTH=7;
IMG_HEIGHT=5;
STEP=20;
 
c=colormap(jet(N));
hold on;
for i=1:STEP:N
    DrawQuad2D(pltY(i,1)-1,pltZ(i,1),pltTheta(i,1),c(i,:));
    DrawQuad2D(pltY2(i,1)+1,pltZ2(i,1),pltTheta2(i,1),c(i,:));
end

hold on;
m(1)=plot(pltY(1:N,1)-1,pltZ(1:N,1),'--k','LineWidth',.75);
m(2)=plot(pltY2(1:N,1)+1,pltZ2(1:N,1),'k','LineWidth',0.75);
k=legend(m([1,2]),{'proposed','benchmark'});

k.Position=k.Position+[-0.25 -0.2 0 0 ];

axis equal;
hold off;
ylim([0 2]);
xlim([-2 2]);
FontSize=7;
xlabel('x position (m)','FontSize',FontSize);
ylabel('z position (m)','FontSize',FontSize);
title('time-optimal maneuver','FontSize',FontSize);
 
set(h,'paperunits','centimeters');
set(h,'papersize',[IMG_WIDTH IMG_HEIGHT]);
set(h,'paperposition',[0,0,IMG_WIDTH,IMG_HEIGHT]);  

set(gca,'FontSize',FontSize); 
ax = gca;
axpos = ax.Position;
ax.Position = axpos+[0.05 0 0 0];

c=colorbar;
c.Limits=[0 (N-1)*Ts];
caxis([0 (N-1)*Ts]);
c.Label.String='Time (s)';
c.Label.FontSize=FontSize; 
cpos=c.Position;

cpos(3)=.5*cpos(3);
cpos(4)=.8*cpos(4);
c.Position=cpos+[-0.050 0.03 0 0]; 
hold off;

set(gca, 'units','normalized','outerposition',[0 0 1 1]);
print -dpdf fig_Benchmarktrajectory.pdf


h=figure(12);
LineWidth=1.5;
IMG_WIDTH=7;
IMG_HEIGHT=7;
FontSize=7;
step=1;
x0=70;
y0=40;
width=270;
height=250;
set(gca,'units','points','position',[x0,y0,width,height]);
Ts=f_opt/(N-1);
F_t=full(res.g(5*N-4:6*N-5));
set(h,'paperunits','centimeters');
set(h,'papersize',[IMG_WIDTH IMG_HEIGHT]);
set(h,'paperposition',[0,0,IMG_WIDTH,IMG_HEIGHT]);
[hAx,hy1,hy2]=plotyy(Ts*(1:step:N-1),F_t(1:N-1),Ts*(1:step:N-1),pltTheta(1:N-1,2));
set(hAx,'FontSize',FontSize);
xlabel('Time (s)');
ylabel('Control input (N/kg)');
title('Control input u_1, u_2 with respect to time');
hy1.LineStyle='--';
hy1.LineWidth=LineWidth;
hy2.LineWidth=LineWidth; 
 
set(hAx(1),'YTick',[0 5 10 15 20]);
set(hAx(2),'YTick',[-10 -5 0 5 10]); 

ylabel(hAx(1),'control input u_1 (m/s^2)','FontSize',FontSize);
ylabel(hAx(2),'control input u_2 (rad/s)','FontSize',FontSize);
h2=legend('u_1','u_2','Location','best');
pos=get(h2,'Position');
set(h2,'Position',pos+[-0.445 -0.2 0 0]);
 
xlabh=get(gca,'XLabel');
set(xlabh,'Position',get(xlabh,'Position')+[0 0.05 0]);
set(gca,'FontSize',FontSize);

startPx=[220 500;305 633;322 128;473 633;629 128];
endPx=[176 410;384 735;406 70;433 704;585 70];

for i=1:5
    strInput=['t_' num2str(i)];
    a=annotation('textarrow',[startPx(i,1)/960 endPx(i,1)/960],[1-startPx(i,2)/838 1-endPx(i,2)/838],'String',strInput);
    a.HeadWidth=5;
    a.HeadLength=5;
    a.FontSize=FontSize;
end
 
print -dpdf fig_ControlInput.pdf
% h2=figure(7);
% PlotResult3(pltY,pltZ,pltTheta,N,h2,f_opt/(N-1));
% h3=figure(8);
% PlotGif(pltY,pltZ,pltTheta,N,Ts,h3);