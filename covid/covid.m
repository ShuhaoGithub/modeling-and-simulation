% To test the results, please change the textread name to the file name.
% Thank you!

clearvars;
A = textread('covid4.txt');
n = A(1,1);
data = A(2:end,:);%data(i,j)=p_ij
dataMinusLog = inf*ones(n,n);
for i = 1:n
    for j = 1:n
        if data(i,j) ~= 0
            dataMinusLog(i,j) = -log(data(i,j));
        end
    end
end
visited = zeros(1,n);
visited(n) = 1;
parent = zeros(1,n);
for i = 1:n-1
    if dataMinusLog(i,n)~=inf
        parent(i) = n;
    end
end

distance = dataMinusLog(:,n);    % shortest distances from source to other nodes;
distance(n,1) = 0;
distance2 = distance;

while sum(visited) < n %dijkstra
    for i = 1:n
        if visited(1,i)==1
            distance2(i,1) = inf;
        end
    end
    [M, I] = min(distance2);
    if M==inf
        break
    end
    visited(1,I) = 1;
    for i = 1:n
        if i~=I && dataMinusLog(i,I)~=inf
            if visited(1,i)==0 && distance(I) + dataMinusLog(i,I) < distance(i)
                distance(i) = distance(I) + dataMinusLog(i,I);
                parent(i) = I;
            end
        end
    end
end

%from parent to tree
path = {};
for i = 1:n-1
    path{i,1} = i;
    j = i;
    while parent(j)~=0
        path{i,1} = [path{i,1},parent(j)];
        j = parent(j);
    end
end
j = 0;
for i = 1:n-1
    j = j+1;
    m = length(path);
    if j<=m
        if ~ismember(n,path{j,1})
            path(j)=[];
            j = j-1;
        end
    else
        break
    end
end
path{length(path)+1,1} = [n];

probability = zeros(length(path),1);
for i = 1:length(path)
    probability(i)=data(path{i,1}(1),path{i,1}(1));
    for j = 2:length(path{i,1})
        probability(i) = probability(i)*data(path{i,1}(j-1),path{i,1}(j));
    end
end

[M, I] = max(probability);
if length(path{I,1})==1
    text = num2str(path{I,1}(1));
    fprintf(text)
else
    text = num2str(path{I,1}(1));
    for i = 2:length(path{I,1})
        text = strcat(text,'-',num2str(path{I,1}(i)));
    end
    fprintf(text)
end
    




    
    
    

        

