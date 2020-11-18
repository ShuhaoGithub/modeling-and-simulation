function sum = SumRhoMu(rho,mu,matrix,x,y,positionx,positiony,deltax,deltay)

sum = rho*(Partialx(matrix,positionx,deltax,x,y)+Partialy(matrix,positiony,deltay,x,y))+mu*(PartialxSquare(matrix,deltax,x,y)+PartialySquare(matrix,deltay,x,y));
end

