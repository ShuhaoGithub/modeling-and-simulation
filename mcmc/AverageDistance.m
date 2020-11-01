function distance = AverageDistance(Position)
n = size(Position,2);
sum = 0;
i = 0;
for j = 1:(n-1)
    for j1 = (j+1):n
        sum = sum + sqrt(power(Position(1,j)-Position(1,j1),2)+power(Position(2,j)-Position(2,j1),2));
        i = i+1;
    end
end
distance = sum/i;
end

