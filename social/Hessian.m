function H = Hessian(x,y,data,delta)
H = zeros(2,2);
sumElement = zeros(size(data,1),3);
for i = 1:size(data,1)
%     sumElement(i,1) = 2*power(SquareSum(x,data(i,1),y,data(i,2)),-2)-8*power(x-data(i,1),2)*power(SquareSum(x,data(i,1),y,data(i,2)),-3);
%     sumElement(i,4) = 2*power(SquareSum(x,data(i,1),y,data(i,2)),-2)-8*power(y-data(i,2),2)*power(SquareSum(x,data(i,1),y,data(i,2)),-3);
%     sumElement(i,2) = 8*(x-data(i,1))*(y-data(i,2))*power(SquareSum(x,data(i,1),y,data(i,2)),-3);
%     sumElement(i,3) = 8*(x-data(i,1))*(y-data(i,2))*power(SquareSum(x,data(i,1),y,data(i,2)),-3);
    sumElement(i,1) = (2*(x-data(i,1))*power(SquareSum(x,data(i,1),y,data(i,2)),-2)-2*(x+delta-data(i,1))*power(SquareSum(x+delta,data(i,1),y,data(i,2)),-2))/delta;
    sumElement(i,2) = (2*(y-data(i,2))*power(SquareSum(x+delta,data(i,1),y,data(i,2)),-2)-2*(y-data(i,2))*power(SquareSum(x,data(i,1),y,data(i,2)),-2))/delta;
    sumElement(i,3) = (2*(x-data(i,1))*power(SquareSum(x,data(i,1),y+delta,data(i,2)),-2)-2*(x-data(i,1))*power(SquareSum(x,data(i,1),y,data(i,2)),-2))/delta;
    sumElement(i,4) = (2*(y-data(i,2))*power(SquareSum(x,data(i,1),y,data(i,2)),-2)-2*(y+delta-data(i,2))*power(SquareSum(x,data(i,1),y+delta,data(i,2)),-2))/delta;
end
H(1,1) = 2 + sum(sumElement(:,1));
H(2,1) = -sum(sumElement(:,2));
H(1,2) = -sum(sumElement(:,3));
H(2,2) = 2 + sum(sumElement(:,4));

end

