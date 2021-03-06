function [xbest,pxbest,nitr,q,status] = NewtonPoly(c,x0,epsilon,maxitr,loud)
%NEWTONPOLY takes a polynomial defined by its coefficients and attempts to
%find a zero of the polynomial using Newton's Method
% 
%   [xbest,pxbest,nitr,q,status] = NewtonPoly(c,x0,epsilon,maxitr,loud)
% 
%Args:
%   c         - A vector that stores the coefficients of a polynomial p.
%               It is in the order of highest to lowest degree
%   x0        - An initial guess at the location of the root of p
%   epsilon   - The convergence requirement: |p(xbest)| < epsilon
%   maxitr    - The maximum number of interations 
%   loud      - *Optional argument* that defaults to 0.  If nonzero, then
%               the fucntion outputs information for each iteration
% 
%Returns:
%   xbest     - The approximate root of p
%   pxbest    - The value of p(xbest)
%   nitr      - The number of iterations the algorithm went through
%   q         - The coeffs of the quotient of p after dividing by (x-xbest)
%   status    - Status variable encoded as follows:
%       status 0: Success! Either both convergence criteria are satisfied  
%                 or an exact root is calculated. 
%       status 1: Failure, the iteration limit was reached or the function
%                 landed on an x where p'(x) is 0
%       status 2: Some failure for other reasons

% If loud doesnt exist, default it to 0
if ~exist('loud','var')
    loud = 0;
end

xbest = 0;              % Best guess of root
pxbest = intmax;        % p(xbest) initialized to max int
nitr = 0;               % Iteration Counter
a = x0;                 % Current Iterate (x value)

p_sym = poly2sym(c);                % Make a symbolic equation p from coeffs
p_prime_sym = diff(p_sym);          % Get the derivative of p
c_prime = sym2poly(p_prime_sym);    % Get the coeffs of the derivative of p 

while(true)
    try
        [px, q] = Horner(c,a);          % Calculate the value p(a) and the reduced polynomial q
        px = double(px);
        p_primex = Horner(c_prime,a);   % Calculate the value p'(a)
        p_primex = double(p_primex);
        
        if(loud ~= 0)
            fprintf(['Itr: ' num2str(nitr) '\tx: ' num2str(a,'%10.2e') '\t|f(x)|' num2str(px,'%10.2e') '\n']);
        end

        if(p_primex ~= 0)               % If the derivative isn't exactly 0,
            a = a - px/p_primex;        % find the next iterate
        else                
            status = 1;                 % Exit if the derivative results in 0
            disp('NewtonPoly failed: It landed at an x where p''(x) is 0');
            return;
        end

        % If this iteration is better than any previous one, save it
        if(abs(real(px)) < abs(real(pxbest)))
            xbest = a;
            pxbest = px;
        end

        % Exit with success if an exact zero is found
        if(pxbest == 0)             
            status = 0;
            return;
        end

        % Exit with a success if criteria are met
        if(abs(real(pxbest)) <= epsilon)
            status = 0;
            return;
        end

        % Exit if the max number of iterations has passed
        nitr = nitr + 1;
        if(nitr >= maxitr)
            status = 1;
            disp('NewtonPoly failed: Max Iterations Reached');
            return;
        end
    catch e
        disp(e);
        status = 2;
        return;
    end
end

end