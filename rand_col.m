function [retcol] = rand_col(rows, start, stop, step)
%RAND_COL Generate a column of random numbers.
%
%   Random numbers will be uniform distribution (if step = 0)
%   or choice from discrete values (if step > 0).
%
%   Arguments:
%   rows -- number of rows (random numbers) in column
%   start -- minimum value of random numbers (inclusive)
%   stop -- maximum value of random numbers (inclusive)
%   step -- if specified, numbers will be of form start + k*step <= stop
%           (where k is a positive integer)

    if rows < 1
        error('UWMadison:MoodleDataset:argValue', ...
            'rows must be > 0', ...
            rows)
    end

    if start > stop
        error('UWMadison:MoodleDataset:argValue', ...
            'start must be > stop', ...
            start, ...
            stop)

    elseif start == stop
        retcol = start * ones([rows, 1]);
        return
    end

    if ~exist('step', 'var')
        % Not specified. Assume uniform distribution.
        step = 0;
    end

    if step < 0
        error('UWMadison:MoodleDataset:argValue', ...
            'step must be >= 0', ...
            step)
    end


    if step == 0
        retcol = start + ((stop - start) * rand([rows, 1]));
    else
        numsteps = floor((stop - start) / step);
        retcol = start + (step * randi(numsteps, [rows, 1]));
    end
end

