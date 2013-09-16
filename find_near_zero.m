function [found] = find_near_zero(data, epsilon)
%FIND_NEAR_ZERO Search data matrix for values within epsilon of 0.0
%
%   Return array of indices:
%       [r1, c1;
%        r2, c2;
%        ...
%        rn, cn]
%   with abs(data(ri, ci)) <= epsilon

    if epsilon <= 0
        error('UWMadison:MoodleDataset:argValue', ...
            'epsilon must be > 0', ...
            epsilon)
    end

    [rows, cols] = find(abs(data) <= epsilon);
    found = [rows, cols];
end
