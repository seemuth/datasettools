% Create problem source data.
numrows = 16;
data = [];

% Column 1: uniform distribution on [-2, 2], rounded to the nearest 0.01
data(:,1) = round(rand_col(numrows, -2, 2) * 100) / 100;

% Column 2: multiples of 0.125 between -4 and 4
data(:,2) = rand_col(numrows, -4, 4, 0.125);

% Force certain values to be near zero for demonstration purposes.
data(8:12,1) = linspace(-0.04, 0.04, 5);
data(8:12,2) = linspace(-0.25, 0.25, 5);

data

num_near_zero = check_near_zero(data, 0.25);
fprintf('\nNumber of values near zero: %d\n', num_near_zero);
