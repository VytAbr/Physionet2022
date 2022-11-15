clear all
clc
close all

physionet_folder = 'C:\Users\50562\OneDrive - Vilniaus Gedimino technikos universitetas\Datasets\physionet\2022\the-circor-digiscope-phonocardiogram-dataset-1.0.3';
training_folder = [physionet_folder filesep 'training_data'];
test_folder = [physionet_folder filesep 'training_data - Copy'];
model_folder = [physionet_folder filesep 'model'];
output_folder = [physionet_folder filesep 'outputs'];

% Task 1 - training model; 2 - runing model; 3 - getting score; 4 - all;
task = 4;

% Need script to preview data
% Need script to separate dataset to train (70%), validation (30%). Stratified
% Later can use cross-validation as test set

%% code for training
if task == 1 || task == 4
    cd('D:\Github\VytAbr\Physionet2022');
    train_model(training_folder, model_folder)
    
    
end
%% Code to generate labels
if task == 2 || task == 4
    cd('D:\Github\VytAbr\Physionet2022');
    run_model(model_folder, test_folder, output_folder)
    
end
%% evaluation of model
if task == 3 || task == 4
    % path to evaluation folder (can be in same file)
    % make sure to setup python before (see tester.m)
    cd('D:\Github\VytAbr\Physionet2022_evaluation')
    output_file = 'scores.csv';
    
    % neveikia jei path su tarpais... python syntax mldc
    evaluate_model(test_folder, output_folder, output_file);
    
end