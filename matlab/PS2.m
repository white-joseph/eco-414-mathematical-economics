% ECO 414 Problem Set 2 - Joe White - 09/22/2025

close all
clc
clear

%%
syms q1 q2 real

% Def price and total quantity
Q = q1 + q2;
p = 100 - Q;

% Profit = Revenue - Cost
pi = p*Q - 2*q1^2 - 3*q2^2;

% Compute Gradient
dpi_dq1 = diff(pi, q1);
dpi_dq2 = diff(pi, q2);

% Solve the System
sol = solve([dpi_dq1 == 0, dpi_dq2 == 0], [q1, q2], 'Real', true);
q1_star = sol.q1;
q2_star = sol.q2;

% Evaluate
Q_star = q1_star + q2_star;
p_star = 100 - Q_star;
pi_star = subs(pi, {q1, q2}, {q1_star, q2_star});

% Compute Hessian
H = [ diff(dpi_dq1, q1), diff(dpi_dq1, q2);
      diff(dpi_dq2, q1), diff(dpi_dq2, q2) ];

% Checks
detH = det(H);
H_num = double(subs(H, {q1, q2}, {q1_star, q2_star}));
detH_num = det(H_num);

%%
% Results
disp('Critical point:');
disp(['q1* = ', char(q1_star)]);
disp(['q2* = ', char(q2_star)]);
disp(['Q*  = ', char(Q_star)]);
disp(['p*  = ', char(p_star)]);
disp(['pi* = ', char(pi_star)]);

disp('Hessian matrix:');
disp(H);
disp(['det(H) = ', char(detH)]);
disp('Hessian at optimum:');
disp(H_num);
disp(['det(H) at optimum: ', num2str(detH_num)]);
