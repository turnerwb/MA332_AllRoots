function [px ,q] = Horner(c ,x0)
%HORNER Evaluates a polynomial whose coefficients are stored in a vector c
%at a point x0 using Horner's method.
%   Detailed explanation goes here

poly_length = length(c);
value = c(1);

for i = 2:poly_length
    value = value*x0 + c(i);
end

px = value;

end

