function [data_del,actual_avg_error_partial,actual_avg_error_all,actual_avg_error_testing  avg_num_class1] =  return_gpr(X_train1,Y_train1,X_train,Y_train,X_testing,Y_testing)

    L = length(Y_train1);   
    data_db = zeros(L,1);
    
for runs = 1:10
   
      k=randperm(L);

    X_train2=X_train1(k,:);
    Y_train2=Y_train1(k,:);    


    gprMdl = fitrgp(X_train2(1:(L-150),:),Y_train2(1:(L-150),:),'Basis','constant',...
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
    
    [data_del_descend,data_del_index] = sort(errors_partial_train,'descend');
    data_del = data_del_index(1:num);
    actual_avg_error_partial = mean(avg_errors_partial);
    actual_avg_error_all = mean(avg_errors_all);
    actual_avg_error_testing = mean(avg_errors_testing);
  
end
    


 
         
     
    
