function PlotAverageDistance(PositionArray,r)
% This function plots the average distance given the PositionArray and r.
% The PositionArray variable is a (r+1)*2n matrix following strictly the output
% format in problem 4c.
% If you want to run it, simply do "PlotAverageDistance(PositionArray,r)".
distance = zeros(r+1,1);
NewPositionSeries = cell(r+1,1);
for i = 1:r+1
    NewPosition = zeros(2,size(PositionArray,2)/2);
    for j = 1:size(PositionArray,2)/2
        NewPosition(1,j) = PositionArray(i,2*j-1);
        NewPosition(2,j) = PositionArray(i,2*j);
    end
    NewPositionSeries{i} = NewPosition;
end
for i = 1:r+1
    distance(i) = AverageDistance(NewPositionSeries{i});
end

for i = 1:r+1
    averageDistance(i,1) = mean(distance(1:i,1));
end
figure;plot(averageDistance(:,1),'LineWidth',2);
end

