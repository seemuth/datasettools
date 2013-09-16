function [num_near_zero] = check_near_zero(data, epsilon)
%CHECK_NEAR_ZERO Check data matrix for values within epsilon of 0.0
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

    indices = find_near_zero(data, epsilon);

    si = size(indices);
    num_near_zero = si(1);

    for i = 1:num_near_zero
        row = indices(i,1);
        col = indices(i,2);
        print_near_zero(row, col);
    end
end
