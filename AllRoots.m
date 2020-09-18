function [r,status] = AllRoots(c ,x0, epsilon, maxitr)
%ALLROOTS Summary of this function goes here
%   Detailed explanation goes here

numRoots = length(c) - 1;
foundRoots = 0;
realMode = 1;       % Real mode on
imaginaryMode = 0;
xinitial = real(x0); % Start trying to find the real roots first
r = [];

while(foundRoots < numRoots)
    
    if(realMode == 1)
        xinitial = real(x0);
    elseif(imaginaryMode == 1)
        xinitial = imag(x0)*i;
    else
        xinitial = x0;
    end
    
    [xbest, pxbest, nitr, q, NPstatus] = NewtonPoly(c, xinitial, epsilon, maxitr);
    
    if(NPstatus == 0)
        r = [r xbest];
        foundRoots = foundRoots + 1;
        c = q;                      % Replace the polynomial 
        disp(['Found Root: ' num2str(xbest)]);
    elseif(NPstatus == 1)
        if(nitr == maxitr) % Max iterations in NewtonPoly Reached
            if(realMode == 1)
                disp(['ImagModeActivated']);
                imaginaryMode = 1;
                realMode = 0;
            elseif(imaginaryMode == 1)
                disp(['ComplexModeActivated']);
                imaginaryMode = 0;
            else
                status = 2;
                return;
            end
        else % NewtonPoly: The derivative is 0
            % Wiggle the initial condition
            x0 = real(x0)+0.1 + (imag(x0)+0.1)*i;
        end
    else
        status = 2;
    end
    
end

status = 0;

