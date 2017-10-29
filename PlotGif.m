function PlotGif(pltY,pltZ,pltTheta,N,Ts,h)
%PlotResult this function will plot the result of the velocity
%yres is the result of the optimal solution. It is a matrix.
%zres is the result of the optimal solution. It is a matrix. 
%theta is the result of the solution. It is a matrix. 
%thrust is the thrust vector
%N is the number of the samples
LineWidth=1.5;
IMG_WIDTH=7;
IMG_HEIGHT=6;
lastStep=1;
filename='vertical.gif';

cl=colormap(jet(N));
step=4;

FontSize=12;

set(h,'paperunits','centimeters');
set(h,'papersize',[IMG_WIDTH IMG_HEIGHT]);
set(h,'paperposition',[0,0,IMG_WIDTH,IMG_HEIGHT]);
set(gca,'FontSize',FontSize);
% c=colorbar;
% c.Limits=[0 (N-1)*Ts];
% caxis([0 (N-1)*Ts]);
% c.Label.String='Time (s)';
% c.Label.FontSize=FontSize;
% 
% cpos=c.Position;
% 
% cpos(3)=0.75*cpos(3);
% c.Position = cpos;
v=VideoWriter('vertical landing.avi');
open(v);
for i=1:step:N
     
     cla(h);
     
     curStep=floor(4);
%     subplot(3,1,1);
    hold on;
    plot(pltY(1:i,1),pltZ(1:i,1),'r');
    DrawQuad2D(pltY(i,1),pltZ(i,1),pltTheta(i,1),cl(i,:));
    
    for j=1:curStep:i
        DrawQuad2D(pltY(j,1),pltZ(j,1),pltTheta(j,1),cl(j,:));
    end
    axis equal 
    hold off;
    xlim([-1,7]);
    ylim([-1,7]);
    xlabel('x position (m)','FontSize',FontSize);
ylabel('z position (m)','FontSize',FontSize);
title('Time optimal maneuver','FontSize',FontSize);

%     subplot(3,1,3);
%     xlim([0 N*Ts]);
%     plot(Ts*(1:i),pltTheta(1:i,2),'r','LineWidth',1.5);
%     xlim([0 N*Ts]);
%     ylim([-10 10]);
%     xlabel('time (s)','FontSize',FontSize);
%     ylabel('input u_2 (rad/s)','FontSize',FontSize);
%     title('input u_2');
%     subplot(3,1,2);
%    
%     plot(Ts*(1:i),20*ones(i,1),'r','LineWidth',1.5);
%     xlim([0 N*Ts]);
%     xlabel('time (s)','FontSize',FontSize);
%     ylabel('input u_1 (m/s^2)','FontSize',FontSize);
%     title('input u_1');
    frame=getframe(gcf);
    im=frame2im(frame);
    [imind,cm]=rgb2ind(im,256);
    if i==1
        imwrite(imind,cm,filename,'gif','DelayTime',0.1,'Loopcount',inf);
    else
        imwrite(imind,cm,filename,'gif','WriteMode','append','DelayTime',0.1);
    end
    writeVideo(v,im);
    pause(0.01);
end

close(v);
end

