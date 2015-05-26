function [x,y] = findFixPoint(A,b)
syms x y
sol = vpasolve([x == A(1,1)*x + A(1,2)*y + b(1),y == A(2,1)*x + A(2,2)*y + b(2)]);
% sol = eye(2) / (eye(2) - A) * b;
x = sol.x;
y = sol.y;