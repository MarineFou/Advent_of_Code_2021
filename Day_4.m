%% Advent of Code 2021 - Day 4

%% inputs
%% Import data from text file
clear
% A=importdata("D:\Documents\PERSO\Advent_of_Code_2021\Day_4_test_data.txt",',');
A=importdata("D:\Documents\PERSO\Advent_of_Code_2021\Day_4_data.txt",',');
bingo_list=A(1,:);
bingo_tables=A(2:end,1:5);
clear A


%% separate bingo tables
k=1;
for i=1:5:size(bingo_tables,1)
    bingo_tab{k}=bingo_tables(i:i+4,:);
    k=k+1;
end
clear i k

%% create filter tables
for i=1:size(bingo_tab,2)
    bingo_tab_filter{i}=false(5,5);
end

%% Part 1
winner=[];
for i=1:length(bingo_list)
    for j=1:size(bingo_tab,2)
        bingo_tab_filter{j}(bingo_tab{j}==bingo_list(i))=true;
        if any(sum(bingo_tab_filter{j},1)==5)
            winner=j;
            return
        elseif any(sum(bingo_tab_filter{j},2)==5)
            winner=j;
            return
        end
    end
end
final_score=sum(bingo_tab{j}(bingo_tab_filter{j}==0)).*bingo_list(i);
disp(final_score)
clear winner i j bingo_tab_filter


%% Part 2
winner=zeros(1,length(bingo_list));
list_boards=1:size(bingo_tab,2);
for i=1:length(bingo_list)
    for j=1:size(list_boards,2)
        bingo_tab_filter{list_boards(j)}(bingo_tab{list_boards(j)}==bingo_list(i))=true;
    end
    for j=1:size(list_boards,2)
%         if winner(i)==0
%             bingo_tab_filter{list_boards(j)}(bingo_tab{list_boards(j)}==bingo_list(i))=true;
            if any(sum(bingo_tab_filter{list_boards(j)},1)==5) || any(sum(bingo_tab_filter{list_boards(j)},2)==5)
                winner(i)=list_boards(j);
                sum_=sum(bingo_tab{list_boards(j)}(bingo_tab_filter{list_boards(j)}==0));
                list_boards(list_boards(:)==list_boards(j))=[];
                if isempty(list_boards)
%                     disp(list_boards)
                    disp(bingo_list(i))
                    return
                end
            end
        end
%     end
end


% final_score=sum_.*bingo_list(i);
% disp(final_score)
% clear winner i j bingo_tab_filter



