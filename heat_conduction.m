%pdepe関数を使うことによって、壁に伝わる熱の時間変化を求めるプログラム

clear all

m = 0;

L = 1;
n = 100;
h = L/n;
kmax = 36000;
d = 1;
xmesh = 0:h:L;
tspan = 0:d:kmax;

sol = pdepe(m,@pdefunc,@icfunc,@bcfunc,xmesh,tspan);
sol = sol';

% function [pl,ql,pr,qr] = bcfun(xl,ul,xr,ur,t)
% 
% pl = ul-1000;
% ql = 0;
% pr = ur-1000;
% qr = 1;
% 
% end
% 
% function [u] = icfunc(x)
% 
% u = 0;
% 
% if (x == 0 || x == 1)
%     u = 1000;
% end
% 
% 
% end
% 
% function [c,f,s] = pdefun(x,t,u,DuDx)
% 
% kappa = 0.14;
% cc = 0.8e+3;
% rho = 2e+3;
% 
% alpha = kappa/(cc*rho);
% 
% c = 1;
% f = alpha*DuDx;
% s = 0;
% 
% end

