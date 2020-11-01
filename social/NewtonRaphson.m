function newGuess = NewtonRaphson(oldGuess,data,delta)
gradient = CopmuteGradient(oldGuess(1),oldGuess(2),data);
H = Hessian(oldGuess(1),oldGuess(2),data,delta);
newGuess = oldGuess-inv(H)*gradient;
end

