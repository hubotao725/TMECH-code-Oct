function PlotResult2(pltY,pltZ,pltTheta,N,h,Ts,caseNum)
%PlotResult this function will plot the result of the velocity
%yres is the result of the optimal solution. It is a matrix.
%zres is the result of the optimal solution. It is a matrix. 
%theta is the result of the solution. It is a matrix. 
%thrust is the thrust vector
%N is the number of the samples

LineWidth=1.5;
IMG_WIDTH=7;
IMG_HEIGHT=5;
STEP=10;
 
c=colormap(jet(N));
hold on;
if caseNum==1
    for i=1:STEP:N
        DrawQuad2D(pltY(i,1)+1,pltZ(i,1),pltTheta(i,1),c(i,:));
    end

    plot(pltY(1:N,1)+1,pltZ(1:N,1),'--k','LineWidth',1.5);
else
    for i=1:STEP:N
        DrawQuad2D(pltY(i,1),pltZ(i,1),pltTheta(i,1),c(i,:));
    end

    plot(pltY(1:N,1),pltZ(1:N,1),'k','LineWidth',1.5);
end

axis equal
xlim([-1,3]);
ylim([-0.5,2]);
FontSize=10;
xlabel('x position (m)','FontSize',FontSize);
ylabel('z position (m)','FontSize',FontSize);
title('time optimal maneuver','FontSize',FontSize);

x0=50;
y0=70;
width=300;
height=200;
set(gca,'units','points','position',[x0,y0,width,height]); 
set(h,'paperunits','centimeters');
set(h,'papersize',[IMG_WIDTH IMG_HEIGHT]);
set(h,'paperposition',[0,0,IMG_WIDTH,IMG_HEIGHT]);  

set(gca,'FontSize',FontSize); 
ax = gca;
axpos = ax.Position;
ax.Position = axpos+[-0.05 0 0 0];

c=colorbar;
c.Limits=[0 (N-1)*Ts];
caxis([0 (N-1)*Ts]);
c.Label.String='Time (s)';
c.Label.FontSize=FontSize; 
cpos=c.Position;

cpos(3)=.5*cpos(3);
cpos(4)=.8*cpos(4);
c.Position=cpos+[+0.05 +0.12 0 0];


end

