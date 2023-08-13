function [data_del,actual_avg_error_partial,actual_avg_error_all,actual_avg_error_testing  avg_num_class1] =  return_gpr(X_train1,Y_train1,X_train,Y_train,X_testing,Y_testing)

    L = length(Y_train1);   
    data_db = zeros(L,1);
    
for runs = 1:30
   
      k=randperm(L);

    X_train2=X_train1(k,:);
    Y_train2=Y_train1(k,:);    


    gprMdl = fitrgp(X_train2(1:(L-150),:),Y_train2(1:(L-150),:),'Basis','linear',...
          'FitMethod','exact','PredictMethod','exact');
    ypred_all_train = predict(gprMdl,X_train);
    ypred_testing = predict(gprMdl,X_testing);
    ypred_partial_train = predict(gprMdl,X_train1);
    
    
       
    errors_partial_train = abs(ypred_partial_train-Y_train1);
    errors_all_train = abs(ypred_all_train-Y_train);
    errors_testing = abs(ypred_testing-Y_testing);
    
    avg_errors_partial(runs) = mean(errors_partial_train);
    avg_errors_all(runs) = mean(errors_all_train);
    avg_errors_testing(runs) = mean(errors_testing);
    
    [data_db_descend,data_db_index] = sort(errors_partial_train,'descend');
    
    [error_class,error_type] = dbscan(data_db_descend,3,0.00006);
    
    num_class = sum(size(unique(error_class))) - 1;
    

    num_class1(runs)=size(find(error_class==(error_class(1))),2);
    
    if num_class>1
        for i=1:4
            if error_class(i) == error_class(1);
                data_del_ini(runs,i) = data_db_index(i);
            else
                data_del_ini(runs,i) = [0];
            end
        end
    else
        data_del_ini = [0];
        break
    end
end

    avg_num_class1 = mean(num_class1);
    num_class1 = [0];

 
    actual_avg_error_partial = mean(avg_errors_partial);
    actual_avg_error_all = mean(avg_errors_all);
    actual_avg_error_testing = mean(avg_errors_testing);
if sum(sum(data_del_ini)) ==0
    data_del = [0];
else
    freq = tabulate(data_del_ini(:));
    freq(freq(:,2)==0,:) = [];
    freq(freq(:,1)==0,:) = [];
    freq(:,3)=[];
    S_freq = size(freq)
    

    freq_descend = sortrows(freq,-2); 
    
    if freq_descend(2,2) >=15
        for i = 1 : S_freq(1,1)
            if freq_descend(i,2)>=15
                data_del(i,:) = freq_descend(i,:);
            end
        end
    else
        data_del(1:3,:) = freq_descend(1:3,:);
    end
end
    


 
         
     
    
