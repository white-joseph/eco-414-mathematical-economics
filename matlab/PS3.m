% ECO 414 - Joe White: Problem Set 3 
% Q6 a & b 
close all; clc; clear;

%% Q6 a) max u(x1,x2)=x1*x2  s.t.  -(x1+x2-2)^2 >= 0  and  x1,x2 >= 0

x0  = [0.5; 1.5];
lb  = [0; 0]; ub = [];
A   = []; b = [];
Aeq = [1 1]; beq = 2;

[xa_star, neg_u_star_a] = fmincon(@obj_Q6a, x0, A, b, Aeq, beq, lb, ub);
ua_star = -neg_u_star_a;

fprintf('\nQ6 a):\n');
fprintf('  x1* = %.6f, x2* = %.6f, u* = %.6f, (x1*+x2*) = %.6f\n', ...
        xa_star(1), xa_star(2), ua_star, sum(xa_star));

%% Q6 b) max u=3x1+2x2  s.t. 4x1 + x2 <= 10,  x1,x2 >= 0

x0  = [0; 0];
lb  = [0; 0]; ub = [];
A   = [4 1]; b = 10;
Aeq = [];    beq = [];

[xb_star, neg_u_star_b] = fmincon(@obj_Q6b, x0, A, b, Aeq, beq, lb, ub);
ub_star = -neg_u_star_b;

fprintf('\nQ6 b):\n');
fprintf('  x1* = %.6f, x2* = %.6f, u* = %.6f, 4x1*+x2* = %.6f (<= 10)\n', ...
        xb_star(1), xb_star(2), ub_star, 4*xb_star(1)+xb_star(2));

%% ===== Functions =====

function f = obj_Q6a(x)
    f = -(x(1)*x(2));
end

function [c,ceq] = con_Q6a(x)
    s = x(1) + x(2) - 2;
    c = s.^2;
    ceq = [];
end

function f = obj_Q6b(x)
    f = -(3*x(1) + 2*x(2));
end