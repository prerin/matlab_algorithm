% ode45関数を使うことによって、公転する惑星に対するスイングバイをシミュレーションするプログラム
%ここで計算した値をswing_movieに入力することでアニメーションとなる

clear all

GM = 1.267e+8;
Vj = 13.06;
R = 71398;

x = -60*R;
y = -30*R;
theta = pi/3;
v = 14;
vx = v * cos(theta);
vy = v * sin(theta);

y0 = [x y vx vy];
tspan = linspace(0,360000,100);

[T,Y] = ode45(@(T,Y) static_func2(T,Y,GM,Vj), tspan, y0);

% function dydt = static_func2(t,y,GM,Vj)
% 
% dydt = zeros(4,1);
% 
% dydt(1) = y(3);
% dydt(2) = y(4);
% dydt(3) = -(GM*(y(1)+t*Vj)) / ((y(1)+t*Vj)^2 + y(2)^2)^(3/2);
% dydt(4) = -(GM*y(2)) / ((y(1)+t*Vj)^2 + y(2)^2)^(3/2);
% 
% end
