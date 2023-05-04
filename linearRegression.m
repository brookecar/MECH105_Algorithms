function [fX, fY, slope, intercept, Rsquared] = linearRegression(x,y)
%linearRegression Computes the linear regression of a data set
%   Compute the linear regression based on inputs:
%     1. x: x-values for our data set
%     2. y: y-values for our data set
%
%   Outputs:
%     1. fX: x-values with outliers removed
%     2. fY: y-values with outliers removed
%     3. slope: slope from the linear regression y=mx+b
%     4. intercept: intercept from the linear regression y=mx+b
%     5. Rsquared: R^2, a.k.a. coefficient of determination

if nargin<1
    error('Need 2 inputs: 2 arrays')
end

if length(x) ~= length(y)
    error('Array inputs need to have same length')
end

[sortedY, sortOrder] = sort(y);
sortedX = x(sortOrder);

x=sortedX;
y=sortedY;

n=length(x);
q1=floor((n+1)/4);
q3=floor((3*n+3)/4);
IQR=y(q3)-y(q1);

outliers= y<(y(q1)-IQR) | y> (y(q3) + IQR);
fY=y(~outliers);
fX=x(~outliers);

n= length(y);
y_avg=mean(fY);
x_avg=mean(fX);
SSx= sum((fX-x_avg).^2);
SP=sum((fX-x_avg).*(fY-y_avg));
slope=SP/SSx

intercept=y_avg-slope.*x_avg

line=slope.*fX+intercept

SStot=sum((fY-y_avg).^2);
SSres=sum((fY-line).^2);
Rsquared=1-(SSres/SStot)


end
