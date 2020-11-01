function PlotScatter(outputMatrix)
% This function plots the scatter of lambda versus recovery percentage.
% The outputMatrix variable is a m*2 matrix following strictly the output
% format in problem 4c.
% If you want to run it, simply do "PlotScatter(outputMatrix)".
figure;
scatter(outputMatrix(:,1),outputMatrix(:,2));
end

