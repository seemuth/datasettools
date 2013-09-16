function [num_near_zero] = check_near_zero(data, epsilon, include_cols)
%CHECK_NEAR_ZERO Check data matrix for values within epsilon of 0.0
%
%   Arguments:
%   data -- check values in this matrix for nearness to zero
%   epsilon -- ``nearness'' parameter
%   include_cols -- if defined, only check values in these columns
%
%   Return the number of values that were near zero.

    if epsilon <= 0
        error('UWMadison:MoodleDataset:argValue', ...
            'epsilon must be > 0', ...
            epsilon)
    end

    function print_near_zero(row, col)
        fprintf('Value at row %2d and col %2d near zero: %+0.6f\n', ...
            row, col, data(row, col))
    end

    indices = sortrows(find_near_zero(data, epsilon), [1, 2]);

    si = size(indices);
    imax = si(1);
    num_near_zero = 0;

    for i = 1:imax
        row = indices(i,1);
        col = indices(i,2);

        if exist('include_cols', 'var')
            if ~ismember(col, include_cols)
                continue
            end
        end

        print_near_zero(row, col);
        num_near_zero = num_near_zero + 1;
    end
end
