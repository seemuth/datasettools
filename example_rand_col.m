% Create problem source data.
numrows = 16;
data = []

% Column 1: uniform distribution on [-4, 4], rounded to the nearest 0.01
data(:,1) = round(rand_col(numrows, -4, 4) * 100) / 100;

% Column 2: multiples of 0.25 between 8 and 12
data(:,2) = rand_col(numrows, 8, 12, 0.25)

% Compute answer column.
data(:,3) = data(:,1) + data(:,2);

data

colnames = {'X', 'Y', 'X_plus_Y'};

precisions = [3, 4, 2];

write_dataset('example_rand_col.tsv', data, colnames, precisions)
