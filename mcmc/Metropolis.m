function New = Metropolis(OldPosition,i,s,flag)
n = size(OldPosition,2);

if flag == 1
    OldValue = OldPosition(1,i);
    for a = 1:s
        if n == 1
            newX = rand;
        else
            E = 0;
            for j = 1:(n-1)
                for j1 = (j+1):n
                    E = E + 1/(sqrt(power(OldPosition(1,j)-OldPosition(1,j1),2)+power(OldPosition(2,j)-OldPosition(2,j1),2)));
                end
            end
            OldPosition(1,i) = rand;
            E1 = 0;
            for j = 1:(n-1)
                for j1 = (j+1):n
                    E1 = E1 + 1/(sqrt(power(OldPosition(1,j)-OldPosition(1,j1),2)+power(OldPosition(2,j)-OldPosition(2,j1),2)));
                end
            end
            delta = E1 - E;
            if delta <= 0
                newX = OldPosition(1,i);
            else
                if exp(-delta) >= rand
                    newX = OldPosition(1,i);
                else
                    newX = OldValue;
                end
            end
        end
        OldPosition(1,i) = newX;
    end
    %NewPosition = [newX;OldPosition(2,i)];
    New = newX;
else
    OldValue = OldPosition(2,i);
    for a = 1:s
        if n == 1
            newY = rand;
        else
            E = 0;
            for j = 1:(n-1)
                for j1 = (j+1):n
                    E = E + 1/(sqrt(power(OldPosition(1,j)-OldPosition(1,j1),2)+power(OldPosition(2,j)-OldPosition(2,j1),2)));
                end
            end
            OldPosition(2,i) = rand;
            E1 = 0;
            for j = 1:(n-1)
                for j1 = (j+1):n
                    E1 = E1 + 1/(sqrt(power(OldPosition(1,j)-OldPosition(1,j1),2)+power(OldPosition(2,j)-OldPosition(2,j1),2)));
                end
            end
            delta = E1 - E;
            if delta <= 0
                newY = OldPosition(2,i);
            else
                if exp(-delta) >= rand
                    newY = OldPosition(2,i);
                else
                    newY = OldValue;
                end
            end
        end
        OldPosition(2,i) = newY;
    end
    %NewPosition = [OldPosition(1,i);newY];
    New = newY;
end

end