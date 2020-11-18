function partialySquare = PartialySquare(matrix,deltay,x,y)

if y > 1 && y < size(matrix,1)
    partialySquare = (matrix(y+1,x)+matrix(y-1,x)-matrix(y,x)*2)/(deltay*deltay);
elseif y == 1
    partialySquare = (matrix(y+1,x)+matrix(size(matrix,1),x)-matrix(y,x)*2)/(deltay*deltay);
elseif y == size(matrix,1)
    partialySquare = (matrix(1,x)+matrix(y-1,x)-matrix(y,x)*2)/(deltay*deltay);
end