function [r,status] = AllRoots(c ,x0, epsilon, maxitr)
%ALLROOTS Summary of this function goes here
%   Detailed explanation goes here

numRoots = length(c) - 1;
foundRoots = 0;
imaginaryMode = 0;
complexMode = 1;
xinitial = x0;
r = [];

while(foundRoots < numRoots)
    
    [xbest, pxbest, nitr, q, NPstatus] = NewtonPoly(c, xinitial, epsilon, maxitr);
    
    if(NPstatus == 0)
        r = [r xbest];
        foundRoots = foundRoots + 1;
        c = q;                      % Replace the polynomial 
    elseif(NPstatus == 1)
        if(nitr == maxitr)
            if(complexMode == 1)
                xinitial = imag(x0)*i;
                disp(['ImagModeActivated:' num2str(xinitial)]);
                imaginaryMode = 1;
                complexMode = 0;
            elseif(imaginaryMode == 1)
                xinitial = real(x0);
                disp(['RealModeActivated:' num2str(xinitial)]);
                imaginaryMode = 0;
            else
                status = 2;
                return;
            end
        end
    else
        status = 2;
    end
    
end

status = 0;

