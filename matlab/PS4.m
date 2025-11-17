% =====================================================================
% ECO 414
% Problem Set 4
% Joe White

clc; clear; close all;


%% ================================================================
%% Question 5
%% ================================================================

% (A) Define A & b
A = [  4,  1, -1;
       1, -1,  0;
     -1/2, 1,  2 ];

b = [240; 50; 105];

disp('A ='); disp(A);
disp('b ='); disp(b);

% (b) A^T
AT = A.';
disp('A^T ='); disp(AT);

% (c) A^(-1)
Ainv = inv(A);
disp('A^-1 ='); disp(Ainv);

% (d) Solve for x = [Y; R; E]
x = A \ b;
Y = x(1); R = x(2); E = x(3);
fprintf('Y = %g,  R = %g,  E = %g\n', Y, R, E);

% (e) Find Ax and check
Ax = A*x;
disp('Ax ='); disp(Ax);
res = Ax - b;
disp('Residual ='); disp(res);
