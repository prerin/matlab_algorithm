%周波数を自分で作ることによって、クラリネットに音に近い音を作るプログラム

clear all
close all
clc


time = 1;
Fs = 10000;
a = 1;
phi = 0;
f = 1000;
K = 50;

t = (1:round(Fs*time)) / Fs;
y = 0;
for x = 1:K
    y = y + (4/pi)*sin(2*pi*(2*x-1)*f*t)/(2*x-1) ;
end
T = zeros(1,Fs);

for x=1:Fs
    xt = x/Fs;
    if(x<=Fs/10)
        T(x) = 10*xt;
    elseif(x>Fs/10 && x<=Fs*4/5)
        T(x) = T(x-1);
    elseif(x>=Fs*9/10)
        T(x) = T(x-1);
    else
        T(x) = 100*(xt-9/10)^2;
    end
end


for x=1:Fs
    y(x) = y(x)*T(x);
end

sound(y, Fs);