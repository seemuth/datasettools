function write_dataset(filename, data, colnames, precisions)
%WRITE_DATASET Write Moodle question dataset to file.
%   Write the dataset contained in matrix data to a tab-delimited file
%   (each row in data corresponds to one question, and each column
%   corresponds to a specific wildcard).
%
%   Arguments:
%   filename -- overwrite this file with the given dataset
%   data -- rows of questions by cols of wildcards
%   colnames -- name of wildcard for each column, EXCLUDING braces
%   precisions -- number of digits after the decimal point for each col

    [data_nr, data_nc] = size(data);

    [names_nr, names_nc] = size(colnames);
    if names_nr > names_nc
        colnames = transpose(colnames);
    end
    [names_nr, names_nc] = size(colnames);

    [precisions_nr, precisions_nc] = size(precisions);
    if precisions_nr > precisions_nc
        precisions = transpose(precisions);
    end
    [precisions_nr, precisions_nc] = size(precisions);

    if data_nc ~= names_nc
        error('UWMadison:MoodleDataset:colNameMismatch', ...
            'Number of data columns and column names do not match', ...
            data_nc, ...
            names_nc)
    end

    if data_nc ~= precisions_nc
        error('UWMadison:MoodleDataset:colPrecisionMismatch', ...
            'Number of data columns and column precisions do not match', ...
            data_nc, ...
            precisions_nc)
    end

    fid = fopen(filename, 'w');

    %%% Write column names to file.
    namestr = sprintf('%s\t', colnames{:});
    fprintf(fid, '%s\n', strtrim(namestr));


    % Prepare row-wise fprintf format string.
    formatstr = sprintf('%%0.%df\\t', precisions);
    % Remove ending '\t'.
    assert(all(formatstr(length(formatstr)-1 : length(formatstr)) == '\t'))
    formatstr(length(formatstr)-1 : length(formatstr)) = '';
    % Append ending '\n'.
    formatstr = strcat(formatstr, '\n');

    %%% Write data to file.
    for row = 1:data_nr
        fprintf(fid, formatstr, data(row,:));
    end

    fclose(fid);

    fprintf('Wrote %s with %d rows and %d cols\n', ...
        filename, data_nr, data_nc)
end

