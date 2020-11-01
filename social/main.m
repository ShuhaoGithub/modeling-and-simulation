% To test the results, please change the textread name to the file name.
% Thank you!

clearvars;
delta = 0.001;
A = textread('SocialDistance2.txt');
initialGuess = A(1,:);
initialGuess = transpose(initialGuess);
n = A(2,1);
data = A(3:end,:);
oldGuess = initialGuess;
for j = 1:10
    newGuess = NewtonRaphson(oldGuess,data,delta);
    if SquareSum(oldGuess(1),newGuess(1),oldGuess(2),newGuess(2))<delta*delta
        break
    end
    oldGuess = newGuess;
end
text = strcat(num2str(newGuess(1))," ",num2str(newGuess(2)));
fprintf(text);












