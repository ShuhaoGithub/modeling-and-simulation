function PlotLine(outputMatrix,T,dt)
% This function plots the scatter of lambda versus recovery percentage.
% The outputMatrix variable is a (T/dt)*3 matrix following strictly the output
% format we need for this plot.
% If you want to run it, simply do "PlotLine(outputMatrix,T,dt)".
figure;
x = 0:dt:T;
plot(x,outputMatrix(:,1),x,outputMatrix(:,2),x,outputMatrix(:,3),'LineWidth',2);
legend('S','I','R');
axis([0 100 0 1011])
end

