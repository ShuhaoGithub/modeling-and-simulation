function partialy = Partialy(matrix,positiony,deltay,x,y)

if y > 1 && y < size(matrix,1)
    partialy = (positiony(y+1)*matrix(y+1,x)-positiony(y-1)*matrix(y-1,x))/(2*deltay);
elseif y == 1
    partialy = (positiony(y+1)*matrix(y+1,x)-positiony(size(matrix,1))*matrix(size(matrix,1),x))/(2*deltay);
elseif y == size(matrix,1)
    partialy = (positiony(1)*matrix(1,x)-positiony(y-1)*matrix(y-1,x))/(2*deltay);
end

