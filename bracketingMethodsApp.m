% Define problem constants
g = 9.81;
mu = 0.55;
F = 150;
m = 25;

format long
% Define the function to be solved for. Is the angle specified in radians or degrees?

f=@(x) ((mu*m*g)./(cosd(x)+(mu*sind(x))))-150;

% THINK, what makes range sense for angle?

x=linspace(0, 90, 1000);

% Plot your function. Does plotting give you an idea about where the root is?

plot(x, f(x))

% Finaly solve for the root using the bisection script given to you, which can be called as:
%[root, fx, ea, iter] = bisect(func, lower_bound, upper_bound);

[root, fx, ea, iter]=bisect(f,0,90,.01,50);

% These variables will be checked for your final answer:
%angle =  % the angle in degree that solves this problem
%fx =     % the function value at your solved angle
%ea =     % the bisection error estimate
%iter =   % the number of bisection iterations

angle= root;
fx= f(angle);
ea= ea;
iter= iter;

fprintf('Theta is %4.4f degrees\n',angle)
fprintf('The value of the function at theta is %4.6f\n',fx)
fprintf('The approximate error is %4.6f degrees\n',ea)
fprintf('The number of iterations the Bisection\n took was %4.4f\n', iter)