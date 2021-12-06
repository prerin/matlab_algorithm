%事前にデータは訓練データとテストデータが分かれて入っています。
% それを使って画像認識を行列のノルム計算を使って識別しています。

sum = zeros(10, 256); 
sum_num = zeros(10, 1);
pic_data = zeros(10, 256);
for i = 1:1707
    for j = 1:10
        if train_id(i) == j
            sum(j,:) = sum(j,:) + train_data(i,:);
            sum_num(j,:) = sum_num(j,:) + 1;
            break
        end
    end
end

for i = 1:10
    pic_data(i,:) = sum(i,:) / sum_num(i);
end

output = zeros(2007,1);
min_array = zeros(10,1);
for  i = 1:2007
    for j = 1:10
        z = pic_data(j,:) - test_data(i,:);
        min_array(j,1) = norm(z);
    end
    [M,I] = min(min_array);
    output(i,1) = I;
end

sum_output = 0;
for i = 1:2007
    if output(i,:) == test_id(i,:)
        sum_output = sum_output + 1;
    end
end

correct = sum_output / 2007;
disp(correct);