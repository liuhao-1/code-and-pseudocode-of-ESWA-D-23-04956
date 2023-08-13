clear
load data.txt;
newData = xlsread('1000newData');

data = [data ; newData];

for times = 1 :30
    
    times

p = 0;
    
[X_result Y_result errors_all(times,:) errors_partial(times,:) errors_testing(times,:) size_del(times,:) linshi(times,:)] =  bagging(data(1:400,1:16),data(1:400,19),data(401:500,1:16),data(401:500,19),p);

end

save gpr_20230219-4-3.mat
