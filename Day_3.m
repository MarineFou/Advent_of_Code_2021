%% Advent of Code 2021 - Day 3

%% inputs
% Import data from text file
% filename: D:\Documents\PERSO\Advent_of_Code_2021\Day_3_test_data.txt
% Set up the Import Options and import the data
opts = delimitedTextImportOptions("NumVariables", 1);
% Specify range and delimiter
opts.DataLines = [1, Inf];
opts.Delimiter = "";
% Specify column names and types
opts.VariableNames = "VarName1";
opts.VariableTypes = "string";
% Specify file level properties
opts.ExtraColumnsRule = "ignore";
opts.EmptyLineRule = "read";
% Specify variable properties
opts = setvaropts(opts, "VarName1", "WhitespaceRule", "preserve");
opts = setvaropts(opts, "VarName1", "EmptyFieldRule", "auto");
% Import the data
test = readmatrix("D:\Documents\PERSO\Advent_of_Code_2021\Day_3_test_data.txt", opts);
input_data = readmatrix("D:\Documents\PERSO\Advent_of_Code_2021\Day_3_data.txt", opts);
% Clear temporary variables
clear opts tbl

test=input_data;
test=char(test);
[n_line n_col]=size(test);

% input_data=table;
for i=1:n_line
    for j=1:n_col
        input_data{i,j}=test(i,j);
    end
end

input_data=categorical(input_data);

 
%% 1st part
for i=1:n_col
    if sum(input_data(:,i)==categorical(0))>sum(input_data(:,i)==categorical(1))
        gamma_rate{i}=categorical(0);
        epsilon_rate{i}=categorical(1);
    else
        gamma_rate{i}=categorical(1);
        epsilon_rate{i}=categorical(0);
    end
end

gamma_rate_s='';
for i=1:n_col
    gamma_rate_s=strcat(string(gamma_rate_s),string(gamma_rate{i}));    
end
gamma_rate_bin=bin2dec(gamma_rate_s);
disp(gamma_rate_bin)

epsilon_rate_s='';
for i=1:n_col
    epsilon_rate_s=strcat(string(epsilon_rate_s),string(epsilon_rate{i}));    
end
epsilon_rate_bin=bin2dec(epsilon_rate_s);
disp(epsilon_rate_bin)

product=gamma_rate_bin.*epsilon_rate_bin;
disp(product)


%% 2nd part
oxy_generator=[];
CO2_scrubber=[];

input_mod=input_data;
for i=1:n_col
    count1=sum(input_mod(:,i)==categorical(1));
    count0=sum(input_mod(:,i)==categorical(0));
    if count1>=count0
        filter=categorical(1);
    else
        filter=categorical(0);
    end
    if size(input_mod,1)>1
        input_mod(input_mod(:,i)~=filter,:)=[];
    else
        return
    end
end

input_mod2=input_data;
for i=1:n_col
    count1=sum(input_mod2(:,i)==categorical(1));
    count0=sum(input_mod2(:,i)==categorical(0));
    if count1>=count0
        filter2=categorical(0);
    else
        filter2=categorical(1);
    end
    if size(input_mod2,1)>1
        input_mod2(input_mod2(:,i)~=filter2,:)=[];
    else
        return
    end
end

oxy_generator_s='';
for i=1:n_col
    oxy_generator_s=strcat(string(oxy_generator_s),string(input_mod(i)));    
end
oxy_generator_bin=bin2dec(oxy_generator_s);
disp(oxy_generator_bin)

CO2_scrubber_s='';
for i=1:n_col
    CO2_scrubber_s=strcat(string(CO2_scrubber_s),string(input_mod2(i)));    
end
CO2_scrubber_bin=bin2dec(CO2_scrubber_s);
disp(CO2_scrubber_bin)

life_support_rating=oxy_generator_bin.*CO2_scrubber_bin;
disp(life_support_rating)


