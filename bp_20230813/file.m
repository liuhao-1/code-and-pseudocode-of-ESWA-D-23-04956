clear
load data.txt;

data_original = data;
cell={};
for times = 1 : 30
    
    times
    
[X_result Y_result errors_all(times,:) errors_partial(times,:) errors_testing(times,:) size_del(times,:) cell{times,1}] =  bagging(data(1:400,1:16),data(1:400,19),data(401:500,1:16),data(401:500,19));
[~,ind(:,times),inda(:,times)] = intersect(cell{times,1},data_original(:,1:16),'row');

end

save bp_change_20230219.mat
