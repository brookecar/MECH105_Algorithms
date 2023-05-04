% LU Factorization

%Description:

%LU factorization is a numerical method used to factor a square matrix into the product of two 
%triangular matrices, one lower triangular and one upper triangular. The LU factorization of a 
%matrix is useful for solving systems of linear equations. The original matrix can be solved by 
%first solving a simplified system using the lower triangular matrix, and then solving another 
%simplified system using the upper triangular matrix.

%Is a MATLAB function that determines the LU Factorization of a square matrix using partial 
%pivoting.

%luFactor(A)
%	LU decomposition with pivotiing
% inputs:
%	A = coefficient matrix
% outputs:
%	L = lower triangular matrix
%	U = upper triangular matrix
%   P = the permutation matrix

%Example of Use:

% Solve the system of equations in the form A*x = b
%   10*x1 + 2*x2 - x3 = 27
%   -3*x1 - 6*x2 + 2*x3 = -61.5
%   x1 + x2 + 5*x3 = -21.5
% Set up A for the given system
%A = [10, 2, -1; 
%      -3, -6, 2;
%       1, 1, 5];
% Set up b
%b = [27; -61.5; -21.5];
% Solve for x
%x = A\b;

% Test your function
%[L, U, P] = luFactor(A)
%[n, n1] = size(A); L=eye(n); P=eye(n); U=A;

%Output:

%L =

%    1.0000         0         0
%   -0.3000    1.0000         0
%    0.1000   -0.1481    1.0000

%U =

%   10.0000    2.0000   -1.0000
%         0   -5.4000    1.7000
%         0         0    5.3519

%P =

%     1     0     0
%     0     1     0
%     0     0     1


%Code:

%Check Matrix Size
if n~=n1
    error('Matrix A is not a square matrix.');
end 

for j = 1:n
  %Find Pivot Element
  [pivot m] = max(abs(U(j:n, j)));     
  m = m+j-1;
  %Pivoting
  if m ~= j
    U([m,j],:) =  U([j,m], :);   
    P([m,j],:) =  P([j,m], :);   
    if j >= 2;   
      L([m,j],1:j-1) =  L([j,m], 1:j-1);  
    end;
  end
  %Finding L and U
  for i = j+1:n      
    L(i, j) = U(i, j) / U(j, j);
    U(i, :) =  U(i, :) - L(i, j)*U(j, :);
  end
end
end



