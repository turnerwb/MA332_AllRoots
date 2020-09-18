function [px ,q] = Horner(c ,x0)
%HORNER Evaluates a polynomial whose coefficients are stored in a vector c
%at a point x0 using Horner's method.
%   Detailed explanation goes here

% Get the polynomial length
poly_length = length(c);

% Make a new array with length of the polynomial - 1
q = sym(zeros(1,poly_length-1));

% Initialize px with the first coeff of the polynomial
px = c(1);

for i = 2:poly_length
    q(i-1) = px; % Value is equal to the coeff of the resulting polynomial
    px = px * x0 + c(i); % Go through the next multiply and add operations
end

end

