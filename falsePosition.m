%False Position

%Description:

%A False Position code in MATLAB is a numerical method for finding the root of a given function 
%within a given interval. The method works by calculating the function values at the endpoints of
%the interval and using these to determine a linear approximation of the function, then finding 
%the x-value where the linear approximation intersects the x-axis, which is the updated estimate 
%of the root. The process is repeated until the desired level of accuracy is achieved, or until a 
%maximum number of iterations is reached. The False Position code in MATLAB automates this process 
%and has inputs and outputs as follows:

%Inputs:
%-func - the function being evaluated
%-x_l - the lower guess
%-x_u - the upper guess
%-es - the desired relative error (should default to 0.0001%)
%-maxit - the maximum number of iterations to use (should default to 200)
%-varargin, . . . - any additional parameters used by the function

%Outputs:
%-root - the estimated root location
%-fx - the function evaluated at the root location
%-ea - the approximate relative error (%)
%-iter - how many iterations were performed

%Example Using a Polynomial:

% Polynomials are a nice starting place, since we have equations for the roots
%testFunc = @(x) x.^3; % the root for this is pretty clearly x=0

% now lets test the function, using default value for es
%x_left = -1;
%x_right = 1;
%[root, fx, ea, iter] = falsePosition(testFunc, x_left, x_right)

%     Output: 

%root =

%     0


%fx =

%     0


%ea =

%   NaN


%iter =

%     1



%Code

root=0;
func=@(x) x.^3;
xl=-1;
xu=1;
maxit=200;
es=0.0001;

if ~isa(func, 'function_handle')
    error('The variable func must be a real function')
end

if func(xl)*func(xu)>=0
    error('xl and xu must satisfy the condition');
end

root=0;
ea=100;

for i=1:maxit
    old=root;
    
    root= xu-((func(xu)*(xl-xu))/(func(xl)-func(xu)));
    
    if sign(root)==sign(xu)
        
        xu=root;
           
    else 
        
        xl=root;
        
    end 
    
    if i>1
        ea=abs((root-old)/root)*100;
        if ea<=es
            break
        else
            if isnumeric(ea)
               break
            end
        end
    end
end

root=root;
ea=ea
fx=func(root);
iter=i;

fzero
