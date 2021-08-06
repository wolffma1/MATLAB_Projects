function y = common_by_row(x)
    if numel(x) == 0
        y = [];
    else
        sz_x = size(x);
        row_1 = x(1,:);
        length_row_1 = length(row_1);
        rest = x;
        rest(1,:) = [];
        sz_rest = size(rest);
        y = zeros(1,length_row_1);
        removal = zeros(length_row_1);
        
        for i = 1:numel(row_1)
            
            temp = x(1,i);
            potential = find(rest == temp);
            [rows cols] = ind2sub(size(rest),potential);
            rows = unique(rows);
            rows = sort(rows)
             
            if (numel(rows)) == sz_rest(1)
                y(i) = temp;
            else
                removal(i) = 1;
            end
                     
        end
        
        indices_to_remove = find(removal)
        y(indices_to_remove) = [];
        y = unique(y);
        y = sort(y)
        
    end
    
end
