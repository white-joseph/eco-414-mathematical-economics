close all
clc 
clear 

%%

syms H K N A alpha beta gamma real
f = A * H^alpha * K^beta * N^gamma;

% Compute the Gradient
gradient = [diff(f, H);
          diff(f, K);
          diff(f, N)];

% Compute the Hessian
hessian = [diff(gradient(1), H), diff(gradient(1), K), diff(gradient(1), N);
      diff(gradient(2), H), diff(gradient(2), K), diff(gradient(2), N);
      diff(gradient(3), H), diff(gradient(3), K), diff(gradient(3), N)];

% Show Results
disp('Gradient:');
disp(gradient);

disp('Hessian:');
disp(hessian);
