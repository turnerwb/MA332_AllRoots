x0 = 1+i;
maxitr = 100;
epsilon = 1e-8;

%% x^2-10=0
c = [1 0 -10];
disp('------------------------------------------------------------------');
disp('Func: x^2-10=0');
[roots, status] = AllRoots(c,x0,epsilon,maxitr);
disp(['Roots: ' num2str(roots)]);
disp(['Status: ' num2str(status)]);

%% x^4-10=0
c = [1 0 0 0 -10];
disp('------------------------------------------------------------------');
disp('Func: x^4-10=0');
[roots, status] = AllRoots(c,x0,epsilon,maxitr);
disp(['Roots: ' num2str(roots)]);
disp(['Status: ' num2str(status)]);

%% x^4+1=0
c = [1 0 0 0 1];
disp('------------------------------------------------------------------');
disp('Func: x^4+1=0');
[roots, status] = AllRoots(c,x0,epsilon,maxitr);
disp(['Roots: ' num2str(roots)]);
disp(['Status: ' num2str(status)]);
%% x^2-2x+1=0
c = [1 -2 1];
disp('------------------------------------------------------------------');
disp('Func: x^2-2x+1=0');
[roots, status] = AllRoots(c,x0,epsilon,maxitr);
disp(['Roots: ' num2str(roots)]);
disp(['Status: ' num2str(status)]);

%% The Wilkinson polynomial
syms x;
P20 = prod(x-(1:20));
P = expand(P20);
c = fliplr(coeffs(P));
disp('------------------------------------------------------------------');
disp('Func: The Wilkinson polynomial');
[roots, status] = AllRoots(c,x0,epsilon,maxitr);
disp(['Roots: ' num2str(roots)]);
disp(['Status: ' num2str(status)]);

%% Random Polynomial
syms x;
R = [1 -1 4 6 6 6 6 6 6 6 -3i 3i 23];
P = prod(x-R(1:length(R)));
P = expand(P);
c = fliplr(coeffs(P));
disp('------------------------------------------------------------------');
disp('Func: Random polynomial');
[roots, status] = AllRoots(c,x0,epsilon,maxitr);
disp(['Roots: ' num2str(roots)]);
disp(['Status: ' num2str(status)]);
%% Random Polynomial
syms x;
R = [-1000 20000 3i -3i];
P = prod(x-R(1:length(R)));
P = expand(P);
c = fliplr(coeffs(P));
disp('------------------------------------------------------------------');
disp('Func: Random polynomial');
[roots, status] = AllRoots(c,x0,epsilon,maxitr);
disp(['Roots: ' num2str(roots)]);
disp(['Status: ' num2str(status)]);