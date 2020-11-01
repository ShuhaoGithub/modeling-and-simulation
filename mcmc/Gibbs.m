function [NewPosition] = Gibbs(OldPosition,s)
n = size(OldPosition,2);
NewPosition = OldPosition;
p = rand;

for i = 1:n
    if (i-1)/n <= p && p <= i/n
        if rand <= 0.5
            flag = 1;% flag for changing x
            NewPosition(1,i) = Metropolis(OldPosition,i,s,flag);
        else
            flag = 2;% flag for chainging y
            NewPosition(2,i) = Metropolis(OldPosition,i,s,flag);
        end
        break
    end
end

