% To test the results, please change the textread name to the file name.
% To test the plot function, please see the instructions inside the
% function body of PlotAverageDistance and SinglePlot. Thank you!

clearvars;
A = textread('three.txt');
n = A(1);
r = A(2);
s = A(3);
InitialPosition = rand(2,n);
PositionSeries = cell(r+1,1);
PositionSeries{1,1} = InitialPosition;
OldPosition = InitialPosition;
for q = 1:r
    [NewPosition] = Gibbs(OldPosition,s);
    PositionSeries{q+1} = [NewPosition(1,:);NewPosition(2,:)];
    OldPosition = NewPosition;
end

% Generate an array following the format of question 4c output.
PositionArray = [];
for i = 1:length(PositionSeries)
    newLine = [];
    for j = 1:size(PositionSeries{i},2)
        newLine = [newLine,PositionSeries{i}(:,j)'];
    end
    PositionArray = [PositionArray;newLine];
end

 % Output
text = "";
for i = 1:r+1
    for j = 1:n
        text = strcat(text,num2str(PositionSeries{i}(1,j))," ",num2str(PositionSeries{i}(2,j))," ");
        %text = strcat(text,num2str(PositionArray(i,j))," ");
    end
    text = strcat(text,"\n");
end
fprintf(text);

%% Plot
PlotAverageDistance(PositionArray,r);% plot average distance
% SinglePlot(PositionArray,r);% plot for the single person