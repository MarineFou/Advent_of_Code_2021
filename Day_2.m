%% Advent of Code 2021 - Day 2

%% inputs
% Import data from text file
% filename: D:\Documents\PERSO\Advent_of_Code_2021\Day_2_test_data.txt
% Set up the Import Options and import the data
opts = delimitedTextImportOptions("NumVariables", 2);
% Specify range and delimiter
opts.DataLines = [1, Inf];
opts.Delimiter = " ";
% Specify column names and types
opts.VariableNames = ["direction", "value"];
opts.VariableTypes = ["categorical", "double"];
% Specify file level properties
opts.ExtraColumnsRule = "ignore";
opts.EmptyLineRule = "read";
opts.ConsecutiveDelimitersRule = "join";
opts.LeadingDelimitersRule = "ignore";
% Specify variable properties
opts = setvaropts(opts, "direction", "EmptyFieldRule", "auto");
% Import the data
test = readtable("D:\Documents\PERSO\Advent_of_Code_2021\Day_2_test_data.txt", opts);
input_data = readtable("D:\Documents\PERSO\Advent_of_Code_2021\Day_2_data.txt", opts);
% Clear temporary variables
clear opts tbl

%% change from test to real inputs
test=input_data;

%% 1st part
pos_hor=0;
pos_depth=0;

pos_hor=sum(test.value(test.direction==categorical(cellstr('forward'))));
pos_depth=sum(test.value(test.direction==categorical(cellstr('down'))))-sum(test.value(test.direction==categorical(cellstr('up'))));

result=pos_hor.*pos_depth;
disp(result)

%% 2nd part
aim=0;
pos_hor=0;
pos_depth=0;

for i=1:height(test)
    if test.direction(i)==categorical(cellstr('down'))
        aim=aim+test.value(i);
    elseif test.direction(i)==categorical(cellstr('up'))
        aim=aim-test.value(i);
    elseif test.direction(i)==categorical(cellstr('forward'))
        pos_hor=pos_hor+test.value(i);
        pos_depth=pos_depth+aim.*test.value(i);
    end
end

result=pos_hor.*pos_depth;
disp(result)

