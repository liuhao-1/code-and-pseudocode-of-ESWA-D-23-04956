function [X_train1 Y_train1 errors_all errors_partial errors_testing size_del del_data] =  bagging(X_train,Y_train,X_testing,Y_testing,p)
    
    data_del = [];
    del_data = [];
    X_train1 = X_train;
    Y_train1 = Y_train;
    
    
    for i = 1: 30
        
        i
    
    X_train1(data_del,:) = [];
    Y_train1(data_del,:) = [];
    
    [data_del,actual_avg_error_partial,actual_avg_error_all,actual_avg_error_testing] = return_bpnn(X_train1,Y_train1,X_train,Y_train,X_testing,Y_testing);
    del_data = [del_data;X_train1(data_del,:)];
    actual_avg_error_partial_1(i) = actual_avg_error_partial;
    actual_avg_error_all_1(i) = actual_avg_error_all;
    actual_avg_error_testing_1(i) = actual_avg_error_testing;
   
    if data_del == [0]
        
        break
    end
     size_del(i) = length(data_del);
    end
    
    errors_all = actual_avg_error_all_1;
    errors_partial = actual_avg_error_partial_1;
    errors_testing = actual_avg_error_testing_1;
    

