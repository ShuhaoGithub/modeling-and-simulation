function SinglePlot(PositionArray,r)
% This function plots the average position (x and y) given the PositionArray and r.
% The PositionArray variable is a (r+1)*2n matrix following strictly the output
% format in problem 4c.
% If you want to run it, simply do "SinglePlot(PositionArray,r)".
MeanSeries = zeros(r,2);
for i = 1:r+1
    MeanSeries(i,1) = mean(PositionArray(1:i,1));
    MeanSeries(i,2) = mean(PositionArray(1:i,2));
end
figure;
plot(MeanSeries(:,1),'LineWidth',2);
figure;
plot(MeanSeries(:,2),'LineWidth',2);
end

