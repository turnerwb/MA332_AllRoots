function [xbest,pxbest,nitr,q,status] = NewtonPoly(c,x0,epsilon,maxitr,loud)
%NEWTONPOLY takes a polynomial defined by its coefficients and attempts to
%find a zero of the polynomial using Newton's Method
% 
%   [xbest,pxbest,nitr,q,status] = NewtonPoly(c,x0,epsilon,maxitr,loud)
% 
%   c         - A vector that stores the coefficients of a polynomial p.
%               It is in the order of highest to lowest degree
%
%   x0        - An initial guess at the location of the root of p
%
%   epsilon   - The convergence requirement: |p(xbest)| < epsilon
% 
%   maxitr    - The maximum number of interations 
% 
%   loud      - *Optional argument* that defaults to 0.  If nonzero, then
%               the fucntion outputs information for each iteration
% 
% OUTPUTS AND STUFF


% If loud doesnt exist, default it to 0
if ~exist('loud','var')
    loud = 0;
end

xbest = 0;              % Best guess of root
pxbest = intmax;        % p(xbest) initialized to max int
nitr = 0;               % Iteration Counter
a = x0;                 % Current Iterate (x value)

p_sym = poly2sym(c);                    % Make a symbolic equation p from coeffs
p_prime_sym = diff(p_sym);              % Get the derivative of p
p = matlabFunction(p_sym);              % Turn p_sym into a function handle
p_prime = matlabFunction(p_prime_sym);  % Turn p_prime_sym into a function handle

while(true)
    if(p_prime(a) ~= 0)             % If the derivative isn't exactly 0,
        a = a - p(a)/p_prime(a);    % find the next iterate
    else                
        status = 1;                 % Exit if the derivative results in 0
        disp('NewtonPoly failed: It landed at an x where p''(x) is 0');
        break;
    end

    % If this iteration is better than any previous one, save it
    if(abs(p(a)) < abs(pxbest))
        xbest = a;
        pxbest = p(a);
    end
    
    % Exit with success if an exact zero is found
    if(pxbest == 0)             
        status = 0;
        break;
    end
    
    % Exit with a success if criteria are met
    if(abs(pxbest) <= epsilon)  
        status = 0;
        break;
    end
    
    % Exit if the max number of iterations has passed
    nitr = nitr + 1;
    if(nitr >= maxitr)
        status = 2;
        break;
    end
end

% If it found a root, reduce the polynomial and return the result
if(status == 0)
    % Divide the symbolic equation p by the root we found to get a quotient
    divisor_sym = poly2sym([1 -1*xbest]);
    [r, quotient_sym] = polynomialReduce(p_sym,divisor_sym); 

    % Get the coeffs of the quotient, and evaluate any fractions to decimal
    q = fliplr(coeffs(quotient_sym));
    q = double(q);
    disp(double(r)); % Remainder is error in the division in a sense
else
    q = 0;
end

