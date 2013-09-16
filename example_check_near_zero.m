% Create problem source data.
numrows = 16;
data = [];

sep = '================================================================';

% Column 1: uniform distribution on [-2, 2], rounded to the nearest 0.01
data(:,1) = round(rand_col(numrows, -2, 2) * 100) / 100;

% Column 2: multiples of 0.125 between -4 and 4
data(:,2) = rand_col(numrows, -4, 4, 0.125);

% Column 3: uniform distribution on [0, 10].
data(:,3) = rand_col(numrows, 0, 10);

% Force certain values to be near zero for demonstration purposes.
data(8:12,1) = linspace(-0.04, 0.04, 5);
data(8:12,2) = linspace(-0.25, 0.25, 5);

data

% Check for values near zero in all columns.
num_near_zero = check_near_zero(data, 0.25);
fprintf('\nNumber of values near zero: %d\n', num_near_zero);

fprintf('\n%s\n', sep);

for col = 1:3
    fprintf('IN COLUMN %d:\n', col);

    % Check for values near zero in only specified column(s).
    num_near_zero = check_near_zero(data, 0.25, [col]);
    fprintf('\nNumber of values in col %d near zero: %d\n', ...
        col, num_near_zero);

    fprintf('\n%s\n', sep);
end
