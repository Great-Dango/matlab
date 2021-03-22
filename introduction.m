%% Task 1
A = rand(4,3)
B = rand(3,4)
C = [A(1,:); A(2,:); A(3,:)]
C = A(1:3,1:3)
X = det(A * B)
%% Task 2
n = randi(10)
A = rand(1,n)
B = rand(n,1)
A * B
B * A
det(A * B)
%% Task 3
A = rand(5,3);
B = rand(2,3);
O = zeros(5,2);
E = eye(2);
X = [ A O; B E ];
T = X(:,5)
%% Task 4
A = rand(6,3);
B = A(1:3,1:3);
x = det(B);
if x ~= 0
    y = B^-1
    disp(B * y)
end
%% Task 5
A = rand(3,5);
B = A(1:3,1:3);
det(B)
B(1,:) = B(2,:)
det(B)
%% Task 6
A = rand(20,20);
e = eig(A)
B = sort(e)
%% Task 7
A = rand(4);
[V, D] = eig(A);
for i = 1:4
    A * V(:,i) - D(i,i) * V(:,i)
end
%% Task 8
n = randi(10)
A = eye(n) .* -2;
A(n,1) = 1;
A(1,n) = 1;
n = n - 1;
B = diag(ones(1,n), 1);
C = diag(ones(1,n), -1);
X = A + B + C
%% Task 9
A = rand(8)
row = [];
for i = 1:8
    row = [row; max(A(:,i))];
end
x = max(row)
row = [];
for i = 1:8
    row = [row; max(A(i,:))];
end
y = max(row)
max(x,y)