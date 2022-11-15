% each folder for separate task.
% if gets more complicated create a header file
training_folder = [physionet_folder filesep 'training_data'];
test_folder = [physionet_folder filesep 'training_data'];
model_folder = [physionet_folder filesep 'model'];
features_folder = [physionet_folder filesep 'features'];
output_folder = [physionet_folder filesep 'outputs'];
scores_file = [physionet_folder filesep 'scores'];

t = datetime;
t_str = [num2str(t.Year) num2str(t.Month, '%0.2i') num2str(t.Day, '%0.2i') ...
    num2str(t.Hour, '%0.2i') num2str(t.Minute, '%0.2i')];

if ~exist(model_folder, 'dir')
    mkdir(model_folder)
end
if task == 1 || task == 4
    model_folder = [model_folder filesep 'model_' t_str];
else % use last model, or set manually
    out_dir = find_folder_name_newest(model_folder);
    model_folder = [model_folder filesep out_dir];
    %     uncomment and edit this, if using manual model file:
    %     model_folder = [model_folder filesep 'model_202211151049'];
end

if ~exist(features_folder, 'dir')
    mkdir(features_folder)
end
if task == 1 || task == 4
    features_folder = [features_folder filesep 'features_' t_str];
else % use last model, or set manually
    out_dir = find_folder_name_newest(features_folder);
    features_folder = [features_folder filesep out_dir];
    %     uncomment and edit this, if using manual model file:
    %     model_folder = [model_folder filesep 'features_202211151049'];
end

if ~exist(output_folder, 'dir')
    mkdir(output_folder)
end
if task == 2 || task == 4
    output_folder = [output_folder filesep 'outputs_' t_str];
else % use last model, or set manually
    out_dir = find_folder_name_newest(output_folder);
    output_folder = [output_folder filesep out_dir];
    %     uncomment and edit this, if using manual model file:
    %     model_folder = [model_folder filesep 'outputs_202211151049'];
end

if ~exist(scores_file, 'dir')
    mkdir(scores_file)
end
scores_file = [scores_file filesep 'scores_' t_str '.csv'];


clear t t_str out_dir

function out_dir = find_folder_name_newest(in_folder)
temp1 = dir(in_folder);
if size(temp1,1) < 3
    out_dir = [];
    return
end
temp5 = strfind(in_folder, filesep);
temp6 = in_folder(max(temp5)+1:end);
for i = size(temp1,1)
    if ~isempty(strfind(temp1(i).name, [temp6 '_20']))
        temp2(i) = str2num(temp1(i).name(size(temp6,2)+2:end));
    end
end
[~, temp3] = max(temp2);
out_dir = temp1(temp3).name;
end