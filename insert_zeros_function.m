function y = insert_zeros(x,n)
    
    diff = 0;
    
    y_dim = numel(x) * (n+1);
    y = zeros(1,y_dim);
    for i = 1:(n+1):(y_dim - n)
        y(i) = x(i-diff);
        diff = diff + n;
    end
    
    y
    
end
