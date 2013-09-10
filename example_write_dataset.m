% Create problem source data.
data = [ 1,  3;
         4,  5;
         7,  8;
        10, 11] * pi;

% Compute answer column.
data(:,3) = data(:,1) + data(:,2);

colnames = {'X', 'Y', 'X_plus_Y'};

precisions = [3, 4, 2];

write_dataset('example_write_dataset.tsv', data, colnames, precisions)
