% =====================================================================
% ECO 414
% Problem Set 5 – Question 5
% Joe White
% =====================================================================

clc; clear;

%% Solve for steady states

syms y

f = (5/2)*y - y^2 - 1/2;
eqn = y == f;

sol = solve(eqn, y);

disp('Steady states:');
disp(sol);

y1 = sol(1);
y2 = sol(2);

%% Local stability test

fprime = diff(f, y);

fprime_y1 = subs(fprime, y, y1);
fprime_y2 = subs(fprime, y, y2);

abs1 = abs(fprime_y1);
abs2 = abs(fprime_y2);

fprintf('y1* = %f,  f''(y1*) = %f,  |f''(y1*)| = %f\n', ...
        double(y1), double(fprime_y1), double(abs1));
fprintf('y2* = %f,  f''(y2*) = %f,  |f''(y2*)| = %f\n', ...
        double(y2), double(fprime_y2), double(abs2));
