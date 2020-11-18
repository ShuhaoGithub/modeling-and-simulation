function partialx = Partialx(matrix,positionx,deltax,x,y)

if x > 1 && x < size(matrix,2)
    partialx = (positionx(x+1)*matrix(y,x+1)-positionx(x-1)*matrix(y,x-1))/(2*deltax);
elseif x == 1
    partialx = (positionx(x+1)*matrix(y,x+1)-positionx(length(positionx))*matrix(y,size(matrix,2)))/(2*deltax);
elseif x == size(matrix,2)
    partialx = (positionx(1)*matrix(y,1)-positionx(x-1)*matrix(y,x-1))/(2*deltax);
end

