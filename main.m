clear all
clc
close all

% update these 2 paths
github_directory = 'D:\Github\VytAbr\Physionet2022';
addpath('evaluation');
physionet_folder = 'C:\Users\50562\OneDrive - Vilniaus Gedimino technikos universitetas\Datasets\physionet\2022\the-circor-digiscope-phonocardiogram-dataset-1.0.3';

% Task 1 - training model; 2 - runing model; 3 - getting score; 4 - all;
task = 4;

% for model_folder features_folder output_folder output_file
directory_organiser;

% Need script to preview data
% Need script to separate dataset to train (70%), validation (30%). Stratified
% Later can use cross-validation as test set

%% code for training
if task == 1 || task == 4
    train_model(training_folder, model_folder)
end
%% Code to generate labels
if task == 2 || task == 4
    run_model(model_folder, test_folder, output_folder)    
end
%% evaluation of model
if task == 3 || task == 4
    % make sure to setup python before (see tester.m)    
    % neveikia jei path su tarpais... python syntax mldc
    
    evaluate_model(test_folder, output_folder, scores_file);
end