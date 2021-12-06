function swing_movie(T,x,y,vx,vy,Vj)
Rj = 71398;
Vel =sqrt(vx.^2+vy.^2);
My=-T*Vj;
tt=(0:32)*2*pi/32; j = 1;
set(0,'defaultAxesFontSize',14); hfig = figure (); 
set(hfig,'Color',[1 1 1])
subplot(2,1,1); cir=My(j)+Rj*(cos(tt)+sqrt(-1)*sin(tt)); 
plot_j=plot(real(cir),imag(cir),'r'); hold on; 
plot_sp=plot(x(1:j),y(1:j),'.-');
xlim([min([x;0]) max([x;0])]); 
ylim([min([y;0]) max([y;0])]); 
title('Trajectory')
hold off;
subplot(2,1,2); plot_v=plot(1:j,Vel(1:j),'-'); hold on;
xlim([0 length(T)+1]); ylim([min(Vel)-2 max(Vel)+2]);
xlabel('Time'); ylabel('Velocity'); hold off;

F(j) = getframe(hfig);

for j = 2:length(T) 
    cir=My(j)+Rj*(cos(tt)+sqrt(-1)*sin(tt)); 
    set(plot_sp ,'XData',x(1:j), 'YData',y(1:j)); 
    set(plot_j ,'XData',real(cir),'YData',imag(cir));
    set(plot_v,'XData',1:j,'YData',Vel(1:j));
    F(j) = getframe(hfig);
end

save mov1 F