clear
load data1.txt;
data = data1;

data_original = data;
cell={};
for times = 1 : 30
    
    times
 
p = 0;
    
[X_result Y_result errors_all(times,:) errors_partial(times,:) errors_testing(times,:) size_del(times,:) cell{times,1}] =  bagging(data(1:1200,1:16),data(1:1200,19),data(1201:1500,1:16),data(1201:1500,19),p);
[~,ind(:,times),inda(:,times)] = intersect(cell{times,1},data_original(:,1:16),'row');


end



save bp_change_20230219.mat
