%周波数を自分で作ることによって、ピアノの音に近い音を作るプログラム

clear all
close all
clc


time = 1;
Fs = 10000;
a = 1;
phi = 0;
f = 800;
K = 50;

t = (1:round(Fs*time)) / Fs;
y = 0;
for k = 1:K
    y = y + 2*(-1)^k*sin(2*pi*(k+1)*f*t)/(pi*(k+1));
end

T = zeros(1,Fs);

for x=1:Fs
    xt = x/Fs;
    if(x<=Fs/5)
        T(x) = -25*xt^2 + 10*xt;
    elseif(x>Fs/5 && x<=Fs/2)
        T(x) = 50/9*(xt-1/2)^2 + 1/2;
    elseif(x>=Fs*4/5)
        T(x) = 25*(xt-1)^2/2;
    else
        T(x) = T(Fs/2);
    end
end


for x=1:Fs
    y(x) = y(x)*T(x);
end

sound(y, Fs);