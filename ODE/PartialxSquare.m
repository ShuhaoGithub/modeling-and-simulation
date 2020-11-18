function partialxSquare = PartialxSquare(matrix,deltax,x,y)

if x > 1 && x < size(matrix,2)
    partialxSquare = (matrix(y,x+1)+matrix(y,x-1)-matrix(y,x)*2)/(deltax*deltax);
elseif x == 1
    partialxSquare = (matrix(y,x+1)+matrix(y,size(matrix,2))-matrix(y,x)*2)/(deltax*deltax);
elseif x == size(matrix,2)
    partialxSquare = (matrix(y,1)+matrix(y,x-1)-matrix(y,x)*2)/(deltax*deltax);
end