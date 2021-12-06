%固有値問題を利用したwebページの人気度解析

root = 'https://www.taiyo-ind.co.jp';
m = 10;
[U,G1] = surfer(root,m);
G = G1 - diag(diag(G1));
G =full(G);
[n,n] = size(G);
c = sum(G,1);
p = 0.8;
d = (1-p)/n;
A = ones(n,n)/n;
for i=1:n
   for j=1:n
      if c(j) ~=0
         A(i,j) = p*G(i,j)/c(j) + d;
      end
   end
end
x = ones(10);
x = x./10;
B = A * x;
[X, D] = eig(A);
lambda = diag(D);
Y = ones(n,2);
for j=1:n
   Y(j,1) = X(j,1);
   Y(j,2) = j;
end
y = sortrows(Y, 'descend');