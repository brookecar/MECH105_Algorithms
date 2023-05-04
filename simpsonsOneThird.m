% Two important quantities when studying fermentation are the carbon dioxide
% evolution rate (g/h) and the oxygen uptake rate (g/h). These are calculated
% from expiremental analysis of the inlet and exit gases of the fermentor, and the
% flow rates, temperature, and pressure of these gases
% Time of Fermentation (hours)
x = [140 141 142 143 144 145 146 147 148 149];
% Carbon Dioxide Evolution Rate (g/hour)
y = [15.72 15.53 15.19 16.56 16.21 17.39 17.36 17.42 17.60 17.75];
% Oxygen Uptake Rate (g/hour)
OxUp = [15.59 16.16 15.35 15.13 14.20 14.23 14.29 12.74 14.74 13.68];

% Using your function in part 1, and the data table below, calculate the total
% amount of carbon dioxide produced and oxygen consumed during fermentation.
% Compare to the value that the MATLAB function trapz() computes. You would
% expect the solutions it be similar but not identical

%CODE

if length(x)~=length(y)
    error('Inputs need to be of the same length')
end

yn= length(y);
xn=length(x);
ends= x(end);
start= x(1);
even= linspace(start,ends,xn);
n=xn-1;

if even~=x
    error('Independent variable vector must be equally spaced')
end


if xn==2
    warning('Only two intervals. Trapezoidal rule will be applied.')
    I= (x(xn)-x(xn-1))*((y(yn-1)+y(yn))/2);

elseif xn==3
    
    I= (x(xn)-x(1))*((y(1)+(4*y(2))+y(3))/6);

% THIS IS WRONG UNDER
elseif xn>3 
    
d= @(x) (-1)^x;

    if d(xn)==-1
    msg('Intervals are even. Simpsons 1/3 Rule will be used through out.')
    % now put in simp 1/3
    ODD=0;
    i=1;
        for k=i:2:yn
        ODD= ODD + y(i);
        end
    
        j=2;
        EVEN=0;
        for z=j:2:(yn-1)
        EVEN= EVEN + y(j);
        end
    
    I= (ends-start)*((y(1)+(4*ODD)+(2*EVEN)+y(yn))/(3*n));
  
    
    elseif d(xn)==1
    warning('Intervals are odd. Trapezoidal rule will be applied on the last segment.')
    %Simp rule but with trap rule at end
    
    ODD=0;
    i=1;
        for k=i:2:yn-1
        ODD=ODD + y(i);
        end
    
        j=2;
        EVEN=0;
        for z=j:2:yn-2
        EVEN= EVEN + y(j);
        end
    
            I= (x(xn-1)-start)*((y(1)+(4*ODD)+(2*EVEN)+y(yn-1))/(3*(n-1)));
    
            TRAP= (x(xn)-x(xn-1))*((y(yn-1)+y(yn))/2);
    
            I= I + TRAP;


end
