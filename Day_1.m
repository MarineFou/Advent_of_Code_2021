%% Advent of Code 2021 - Day 1

%% inputs
% test_set
test=[199,200,208,210,200,207,240,269,260,263];

% Import data from text file
% filename: D:\Documents\PERSO\Advent_of_Code_2021\Day_1_data.txt
% Set up the Import Options and import the data
opts = delimitedTextImportOptions("NumVariables", 1);
% Specify range and delimiter
opts.DataLines = [1, Inf];
opts.Delimiter = ",";
% Specify column names and types
opts.VariableNames = "input_data";
opts.VariableTypes = "double";
% Specify file level properties
opts.ExtraColumnsRule = "ignore";
opts.EmptyLineRule = "read";
% Import the data
tbl = readtable("D:\Documents\PERSO\Advent_of_Code_2021\Day_1_data.txt", opts);
% Convert to output type
input_data = tbl.input_data;
% Clear temporary variables
clear opts tbl

%% change from test to real inputs
test=input_data;

%% 1st part
k=0;
for i=2:length(test)
    if test(i)>test(i-1)
        k=k+1;
    end    
end
disp(k)

%% 2nd part
test_slide_3=[];
for i=1:length(test)
    if i+2<=length(test)
        test_slide_3(i)=test(i)+test(i+1)+test(i+2);
    else
        return
    end
end
% besoin de refaire au propre la boucle d'avant

k=0;
for i=2:length(test_slide_3)
    if test_slide_3(i)>test_slide_3(i-1)
        k=k+1;
    end    
end

disp(k)

