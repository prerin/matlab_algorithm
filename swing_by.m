% ode45関数を使うことによって、指定の値のもと、静止した重力場に対するスイングバイをシミュレーションするプログラム
%ここで計算した値をswing_movieに入力することでアニメーションとなる

clear all

GM = 1.267e+8;
R = 71398;
Vj = 0;

x = 15*R;
y = -30*R;
theta = pi/3;
v = 14;
vx = v * cos(theta);
vy = v * sin(theta);

y0 = [x y vx vy];
tspan = linspace(0,360000,100);

[T,Y] = ode45(@(T,Y) static_func(T,Y,GM), tspan, y0);

% function dydt = static_func(t,y,GM)
% 
% dydt = zeros(4,1);
% 
% dydt(1) = y(3);
% dydt(2) = y(4);
% dydt(3) = -(GM*y(1)) / (y(1)^2 + y(2)^2)^(3/2);
% dydt(4) = -(GM*y(2)) / (y(1)^2 + y(2)^2)^(3/2);
% 
% end
