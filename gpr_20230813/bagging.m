function [X_train1 Y_train1 errors_all errors_partial errors_testing size_del linshi] =  bagging(X_train,Y_train,X_testing,Y_testing,p)
    
    data_del = [];
    
    X_train1 = X_train;  %%400
    Y_train1 = Y_train;
    
    for i = 1: 30
        
        i
    
    X_train1(data_del,:) = [];
    Y_train1(data_del,:) = [];
    
    [data_del,actual_avg_error_partial,actual_avg_error_all,actual_avg_error_testing,avg_num_class1] = return_gpr(X_train1,Y_train1,X_train,Y_train,X_testing,Y_testing);
    
    
    
    linshi(i) = avg_num_class1;
    actual_avg_error_partial_1(i) = actual_avg_error_partial;
    actual_avg_error_all_1(i) = actual_avg_error_all;
    actual_avg_error_testing_1(i) = actual_avg_error_testing;
    data_del(:,2) = [];
   
    if data_del == [0]
        
        break
    end
     size_del(i) = length(data_del);
    end
    
    errors_all = actual_avg_error_all_1;
    errors_partial = actual_avg_error_partial_1;
    errors_testing = actual_avg_error_testing_1;
    

