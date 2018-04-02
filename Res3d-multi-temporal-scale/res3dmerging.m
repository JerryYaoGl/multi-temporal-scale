function [data_matrix ]= res3dmerging(scale, output_list_relative)
% Read c3d features (fc6) for videos in ucf101 dataset.
% For each video, average all its features and get a video descriptor.

    % rather than fileread, importdata save each line separetely.
    dir_list = importdata(output_list_relative);

    dim_feat = 25088;
    num_train_video = size(dir_list, 1);
    data_matrix = zeros(num_train_video, dim_feat);
    

    for i = 1 : size(dir_list, 1)
        dir_str = char(dir_list(i));
        feat_files = dir([scale, '/', dir_str, '/*.res5b']);
        num_feat = length(feat_files);
        feat = zeros(num_feat, dim_feat);
        for j = 1 : num_feat
            feat_path = strcat(scale, '/', dir_str, '/', feat_files(j).name);
            disp(feat_path);
            [~, feat(j,:)] = read_binary_blob(feat_path);
        end
        avg_feat = mean(feat, 1);
        avg_feat_double = double(avg_feat);
        feature = avg_feat_double / norm(avg_feat_double);
        data_matrix(i, :) = feature;
    end
end
