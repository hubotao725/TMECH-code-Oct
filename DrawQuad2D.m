function DrawQuad2D(x,z,theta,colorSel)
%DrawQuad2D this function draws the 2D quadrotor
%x is the horizontal position
%z is the height
%theta is the tilting angle
LineWidth=1.5;
n=length(x);
QuadWidth=0.25;
QuadHeight=0.1; 
quadLine=[-QuadWidth:0.2*QuadWidth:QuadWidth;...
          zeros(1,11)];
quadbar=[-QuadWidth*ones(1,11);0:0.1*QuadHeight:QuadHeight];
quadbar2=[QuadWidth*ones(1,11);0:0.1*QuadHeight:QuadHeight];


quadnew=[cos(theta) sin(theta);...
    -sin(theta) cos(theta)]*quadLine+[x;z]*ones(1,11);
quadbarres=[cos(theta) sin(theta);...
    -sin(theta) cos(theta)]*quadbar+[x;z]*ones(1,11);
quadbarres2=[cos(theta) sin(theta);...
    -sin(theta) cos(theta)]*quadbar2+[x;z]*ones(1,11);
%lot(quadnew(1,:),quadnew(2,:),'k','LineWidth',1.5);
xpos=[quadnew(1,:) quadbarres(1,:) ];
ypos=[quadnew(2,:) quadbarres(2,:) ];
plot(xpos,ypos,'Color',colorSel,'LineWidth',LineWidth);
plot(quadbarres(1,:),quadbarres(2,:),'Color',colorSel,'LineWidth',LineWidth);


plot(quadbarres2(1,:),quadbarres2(2,:),'Color',colorSel,'LineWidth',LineWidth);

end