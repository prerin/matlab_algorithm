%先のノルム計算と同じデータを使って主成分分析を使って画像認識を行っています。

sum = zeros(10, 256); 
sum_num = zeros(10, 1);
for i = 1:1707
    for j = 1:10
        if train_id(i) == j
            sum(j,:) = sum(j,:) + train_data(i,:);
            sum_num(j,:) = sum_num(j,:) + 1;
            break
        end
    end
end

A1 = zeros(256, sum_num(1,:));
c1 = 1;
A2 = zeros(256, sum_num(2,:));
c2 = 1;
A3 = zeros(256, sum_num(3,:));
c3 = 1;
A4 = zeros(256, sum_num(4,:));
c4 = 1;
A5 = zeros(256, sum_num(5,:));
c5 = 1;
A6 = zeros(256, sum_num(6,:));
c6 = 1;
A7 = zeros(256, sum_num(7,:));
c7 = 1;
A8 = zeros(256, sum_num(8,:));
c8 = 1;
A9 = zeros(256, sum_num(9,:));
c9 = 1;
A10 = zeros(256, sum_num(10,:));
c10 = 1;

for i = 1:1707
    if train_id(i,:) == 1
        A1(:,c1) = transpose(train_data(i,:));
        c1 = c1 + 1;
    elseif train_id(i,:) == 2
        A2(:,c2) = transpose(train_data(i,:));
        c2 = c2 + 1;
    elseif train_id(i,:) == 3
        A3(:,c3) = transpose(train_data(i,:));
        c3 = c3 + 1;
    elseif train_id(i,:) == 4
        A4(:,c4) = transpose(train_data(i,:));
        c4 = c4 + 1;
    elseif train_id(i,:) == 5
        A5(:,c5) = transpose(train_data(i,:));
        c5 = c5 + 1;
    elseif train_id(i,:) == 6
        A6(:,c6) = transpose(train_data(i,:));
         c6 = c6 + 1;
    elseif train_id(i,:) == 7
        A7(:,c7) = transpose(train_data(i,:));
        c7 = c7 + 1;
    elseif train_id(i,:) == 8
        A8(:,c8) = transpose(train_data(i,:));
        c8 = c8 + 1;
    elseif train_id(i,:) == 9
        A9(:,c9) = transpose(train_data(i,:));
        c9 = c9 + 1;
    elseif train_id(i,:) == 10
        A10(:,c10) = transpose(train_data(i,:));
        c10 = c10 + 1;
    end
end

[U1,S1,V1] = svd(A1,'econ');
[U2,S2,V2] = svd(A2,0);
[U3,S3,V3] = svd(A3,0);
[U4,S4,V4] = svd(A4,0);
[U5,S5,V5] = svd(A5,0);
[U6,S6,V6] = svd(A6,0);
[U7,S7,V7] = svd(A7,0);
[U8,S8,V8] = svd(A8,0);
[U9,S9,V9] = svd(A9,0);
[U10,S10,V10] = svd(A10,0);

u = zeros(256, 10);

for i = 1:10
    for j = 1:10
        u(:,j,1) = U1(:,j);
        u(:,j,2) = U2(:,j);
        u(:,j,3) = U3(:,j);
        u(:,j,4) = U4(:,j);
        u(:,j,5) = U5(:,j);
        u(:,j,6) = U6(:,j);
        u(:,j,7) = U7(:,j);
        u(:,j,8) = U8(:,j);
        u(:,j,9) = U9(:,j);
        u(:,j,10) = U10(:,j);
    end
end

output2 = zeros(2007,1);
min_array2 = zeros(10,1);

for i = 1:2007
    for j = 1:10
        ut = transpose(u(:,:,j));
        tt = transpose(test_data(i,:));
        z = (eye(256) - u(:,:,j) * ut) * tt;
        min_array2(j,:) = norm(z);
    end
    [M,I] = min(min_array2);
    output2(i,1) = I;
end

