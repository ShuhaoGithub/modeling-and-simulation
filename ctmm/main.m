% To test the results, please change the textread name to the file name.
% To test the plot function, please see the instructions inside the
% function body of PlotScatter. Thank you!

clearvars;
A = textread('0.001.txt');
m = A(1);
N = A(2);
k = A(3);
lambda1 = A(4);
lambda2 = A(5);
lambda3 = A(6);
lambda = rand(m,1)*lambda1;
rng('default')

initialState = zeros(m,3);
initialState(:,1) = N - k;
initialState(:,2) = k;
currentState = initialState;
t = 0;
s = 0;
while s ~= m
    expVarMatrix = zeros(m,5);
    for i = 1:m
        expVarMatrix(i,1) = exprnd(N/(lambda(i,1)*currentState(i,2)*currentState(i,1)));
        expVarMatrix(i,2) = exprnd(1/(lambda2*currentState(i,2)));
        expVarMatrix(i,3) = exprnd(1/(lambda3*currentState(i,2)));
        expVarMatrix(i,4) = exprnd(1/(lambda3*currentState(i,3)));
        expVarMatrix(i,5) = exprnd(1/(lambda3*currentState(i,1)));
    end
    expVarMatrix(expVarMatrix==0)=Inf;
    [row,column]=find(expVarMatrix==min(min(expVarMatrix)));
    dt = expVarMatrix(row,column);
    if column == 1
        currentState(row,1) = currentState(row,1)-1;
        currentState(row,2) = currentState(row,2)+1;
    elseif column == 2
        currentState(row,3) = currentState(row,3)+1;
        currentState(row,2) = currentState(row,2)-1;
    else
        j = randi([1,m]);
        while j == row
            j = randi([1,m]);
        end
        if column == 3
            currentState(row,2) = currentState(row,2)-1;
            currentState(j,2) = currentState(j,2)+1;
        elseif column == 4
            currentState(row,3) = currentState(row,3)-1;
            currentState(j,3) = currentState(j,3)+1;
        elseif column == 5
            currentState(row,1) = currentState(row,1)-1;
            currentState(j,1) = currentState(j,1)+1;
        end
    end
        t = t + dt;
        s = sum(currentState(:,2)==0)
end
        
        
% Output
outputMatrix = zeros(m,2);
outputMatrix(:,1) = lambda;
for i = 1:m
    outputMatrix(i,2) = currentState(i,3)/(currentState(i,3)+currentState(i,1));
end
text = "";
for i = 1:m
    text = strcat(text,num2str(outputMatrix(i,1))," ",num2str(outputMatrix(i,2)),"\n");
end
fprintf(text);

%% Plot
PlotScatter(outputMatrix)

