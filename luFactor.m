% luFactor(A)
%	LU decomposition with pivotiing
% inputs:
%	A = coefficient matrix
% outputs:
%	L = lower triangular matrix
%	U = upper triangular matrix
%   P = the permutation matrix

[n, n1] = size(A); L=eye(n); P=eye(n); U=A;

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



