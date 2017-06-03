 function x = GaussSeidel( A ,B ) 
 
[na , ma ] = size (A);
if na ~= ma
    disp('ERROR: Matrix A must be a square matrix')
    return
end
 
% Inputting matrix B
[nb , mb ] = size (B);
if nb ~= na || mb~=1
   disp( 'ERROR: Matrix B must be a column matrix')
   return
end
 
% Separation of matrix A into lower triangular and upper triangular matrices
 
% A = D + L + U
 
D = diag(diag(A));
L = tril(A)- D;
U = triu(A)- D
 
% check for convergence condition for Gauss-Seidel method
 
e= max(eigs(-inv(D+L)*(U)));
if abs(e) >= 1
    disp ('Since the modulus of the largest Eigen value of iterative matrix is not less than 1') 
    disp ('this process is not convergent.')
    return
end
 
% initial guess for X..?
 
% default guess is [ 1 1 .... 1]
 
r = 'n'
switch r 
    case 'y'
        % asking for initial guess
    X0 = input('Enter initial guess for X :\n')
        % check for initial guess
    [nx, mx] = size(X0);
        if nx ~= na || mx ~= 1
        disp( 'ERROR: Check input')
        return
    end
    otherwise
    X0 = ones(na,1);
end
 
% allowable error in final answer
 
t = (10^-7);
tol = t*ones(na,1);
k= 1;
 
X( : , 1 ) = X0;
err= 1000000000*rand(na,1);% initial error assumption for looping
while sum(abs(err) >= tol) ~= zeros(na,1)
    X ( : ,k+ 1 ) = -inv(D+L)*(U)*X( : ,k) + inv(D+L)*B;% Gauss-Seidel formula
    err = X( :,k+1) - X( :, k);% finding error
    k = k + 1;
    
end
 
fprintf ('The final answer obtained after %g iterations is  \n', k)
x = X(:,k)