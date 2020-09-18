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
%% x^2
syms x;
R = [0 0];
P = prod(x-R(1:length(R)));
P = expand(P);
c = fliplr(coeffs(P));
disp('------------------------------------------------------------------');
disp('Func: x^2');
[roots, status] = AllRoots(c,x0,epsilon,maxitr);
disp(['Roots: ' num2str(roots)]);
disp(['Status: ' num2str(status)]);
%% x^4+4*x^3+10*x^2+12*x+9
syms x;
R = [-1+sqrt(2)*i -1+sqrt(2)*i -1-sqrt(2)*i -1-sqrt(2)*i];
P = prod(x-R(1:length(R)));
P = expand(P);
c = fliplr(coeffs(P));
disp('------------------------------------------------------------------');
disp('Func: x^4+4*x^3+10*x^2+12*x+9');
[roots, status] = AllRoots(c,x0,epsilon,maxitr);
disp(['Roots: ' num2str(roots)]);
disp(['Status: ' num2str(status)]);
%% x^4-10000.001*x^3+11.000*x^2-10000.001*x+10.000+0.*I
syms x;
R = [0.001 1e4 i -i];
P = prod(x-R(1:length(R)));
P = expand(P);
c = fliplr(coeffs(P));
disp('------------------------------------------------------------------');
disp('Func: x^4-10000.001*x^3+11.000*x^2-10000.001*x+10.000+0.*I');
[roots, status] = AllRoots(c,x0,epsilon,maxitr);
disp(['Roots: ' num2str(roots)]);
disp(['Status: ' num2str(status)]);
%% x^7+3*x^6+7*x^5+13*x^4+16*x^3+16*x^2+12*x+4
syms x;
R = [-1 -1 -1 sqrt(2)*i -sqrt(2)*i];
P = prod(x-R(1:length(R)));
P = expand(P);
c = fliplr(coeffs(P));
disp('------------------------------------------------------------------');
disp('Func: x^7+3*x^6+7*x^5+13*x^4+16*x^3+16*x^2+12*x+4');
[roots, status] = AllRoots(c,x0,epsilon,maxitr);
disp(['Roots: ' num2str(roots)]);
disp(['Status: ' num2str(status)]);
%% x^2+sqrt(2)*x+sqrt(3)*x+sqrt(2)*sqrt(3)
syms x;
R = [sqrt(2) sqrt(3)];
P = prod(x-R(1:length(R)));
P = expand(P);
c = fliplr(coeffs(P));
disp('------------------------------------------------------------------');
disp('Func: x^2+sqrt(2)*x+sqrt(3)*x+sqrt(2)*sqrt(3)');
[roots, status] = AllRoots(c,x0,epsilon,maxitr);
disp(['Roots: ' num2str(roots)]);
disp(['Status: ' num2str(status)]);