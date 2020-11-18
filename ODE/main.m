% To test the results, please change the textread name to the file name.
% To test the plot function, please see the instructions inside the
% function body of PlotLine. Thank you!
% The conservation of mass is taken care of inside the Partialx and Partialy function so
% the step size only has trivial effect on the convergence in my program.

clearvars;
fileName = '1.txt';
A = textread(fileName);
lambda1 = A(1);
lambda2 = A(2);
mu = A(3);
rho = A(4);
S0 = A(5);
I0 = A(6);
R0 = A(7);
T = A(8);
m = A(9);
n = A(10);
dt = A(11);
T = dt*ceil(T/dt);
dx = A(12);
dy = A(13);
positionx = -1+1/(m-1):2/(m-1):1-1/(m-1);
positiony = -1+1/(n-1):2/(n-1):1-1/(n-1);
% evenly initiation settings with N0
S = ones(length(positiony),length(positionx))*S0;
I = ones(length(positiony),length(positionx))*I0;
R = ones(length(positiony),length(positionx))*R0;
% random initiation settings with bound [0,N0]
% S = rand(length(positiony),length(positionx))*S0;
% I = rand(length(positiony),length(positionx))*I0;
% R = rand(length(positiony),length(positionx))*R0;
S0 = sum(sum(S))/(length(positiony)*length(positionx));
I0 = sum(sum(I))/(length(positiony)*length(positionx));
R0 = sum(sum(R))/(length(positiony)*length(positionx));
SumS = cell(T/dt,1);
SumI = cell(T/dt,1);
SumR = cell(T/dt,1);
for i = 1:(T/dt)
    intermediateS = zeros(length(positiony),length(positionx));
    intermediateI = zeros(length(positiony),length(positionx));
    intermediateR = zeros(length(positiony),length(positionx));
    nextS = zeros(length(positiony),length(positionx));
    nextI = zeros(length(positiony),length(positionx));
    nextR = zeros(length(positiony),length(positionx));
    for x = 1:length(positionx)
        for y = 1:length(positiony)
            intermediateS(y,x) = S(y,x) + dt/2*(SumRhoMu(rho,mu,S,x,y,positionx,positiony,dx,dy)-lambda1*S(y,x)*I(y,x)/(S(y,x)+I(y,x)+R(y,x)));
            intermediateI(y,x) = I(y,x) + dt/2*(SumRhoMu(rho,mu,I,x,y,positionx,positiony,dx,dy)+lambda1*S(y,x)*I(y,x)/(S(y,x)+I(y,x)+R(y,x))-lambda2*I(y,x));
            intermediateR(y,x) = R(y,x) + dt/2*(SumRhoMu(rho,mu,R,x,y,positionx,positiony,dx,dy)+lambda2*I(y,x));
        end
    end
    for x = 1:length(positionx)
        for y = 1:length(positiony)
            nextS(y,x) = S(y,x) + dt*(SumRhoMu(rho,mu,intermediateS,x,y,positionx,positiony,dx,dy)-lambda1*intermediateS(y,x)*intermediateI(y,x)/(intermediateS(y,x)+intermediateI(y,x)+intermediateR(y,x)));
            nextI(y,x) = I(y,x) + dt*(SumRhoMu(rho,mu,intermediateI,x,y,positionx,positiony,dx,dy)+lambda1*intermediateS(y,x)*intermediateI(y,x)/(intermediateS(y,x)+intermediateI(y,x)+intermediateR(y,x))-lambda2*intermediateI(y,x));
            nextR(y,x) = R(y,x) + dt*(SumRhoMu(rho,mu,intermediateR,x,y,positionx,positiony,dx,dy)+lambda2*intermediateI(y,x));
        end
    end
    SumS{i,1} = nextS;
    SumI{i,1} = nextI;
    SumR{i,1} = nextR;
    S = nextS;
    I = nextI;
    R = nextR;
end
        
% Output
outputMatrix = zeros(T/dt+1,3);
outputMatrix(1,:) = [S0,I0,R0];
for i = 1:T/dt
    outputMatrix(i+1,1) = sum(sum(SumS{i,1}))/(length(positiony)*length(positionx));
    outputMatrix(i+1,2) = sum(sum(SumI{i,1}))/(length(positiony)*length(positionx));
    outputMatrix(i+1,3) = sum(sum(SumR{i,1}))/(length(positiony)*length(positionx));
end

%% Plot and write
PlotLine(outputMatrix,T,dt);
