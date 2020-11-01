function gradient = CopmuteGradient(x,y,data)
gradient = zeros(2,1);
sumElement = zeros(size(data,1),2);
for i = 1:size(data,1)
    sumElement(i,1) = 2*(x-data(i,1))*power(power(x-data(i,1),2)+power(y-data(i,2),2),-2);
    sumElement(i,2) = 2*(y-data(i,2))*power(power(x-data(i,1),2)+power(y-data(i,2),2),-2);
end
sumxTotal = sum(sumElement(:,1));
sumyTotal = sum(sumElement(:,2));
gradient(1,1) = 2*x-sumxTotal;
gradient(2,1) = 2*y-sumyTotal;
end

