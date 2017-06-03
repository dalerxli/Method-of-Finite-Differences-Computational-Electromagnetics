function [A3] = magneticVectorPotential(M,N,radius)
% magneticVectorPotential(M,N,radius): Using the method of finite
% differences, function finds the magnetic vector potential of a current
% carrying wire that satisfies Poisson's equation.
%   The function will assume a DC current of 1 A.
%   Input M: number of angular steps.
%   Input N: number of radial steps.
%   Input radius: radius of the current carrying wire.
%   Output A3: magnetic vector potential in the z direction inside wire.

%   Version 1: created 20/05/17. Author D. Gormley
%   This MATLAB function calculates the magnetic vector potential inside a
%   current carrying wire.

%=========================================================================%
%Internal Parameters
mu = (4*pi)*(10^-7);    %magnetic permeability (H/m)
current = 1;            %DC current (Ampere)
I = eye(M);             %Setting up the identity matrix

%=========================================================================%

%Error Checking: To ensure the correct values were inputted into function.
if (nargin ~= 3), error('Incorrect number of input arguments.'); end

%Setting up the index
m = [0:(M-1)];      %Index for angle
i = [1:(N-1)];      %Index for radius

%Setting up the step size for radius and angle
h = (4*radius)/(2*N-1); %radial step
Delta = (2*pi)/M;       %angular step

%Radius redifened to avoid the diffculties of dividing by zero
r_i = (i-0.5)*h;

%Setting up appropriate matrix
em1 = (1./(h^2) - 1./(2*h*r_i))';               %sub-diagonal
e0 = (-(2./(h^2) + 2./((r_i.^2)*(Delta.^2))))'; %main diagonal
e1 = (1./(h.^2) + 1./(2*h*r_i))';            %super-diagonal

D = (1./((r_i.^2)*(Delta.^2)))';    %Coefficients of main diagonal that are
%multiplied by the Stot matrix S + S'

%Setting up the final matrix that is to be multiplied by the Identity
%Matrix
R = spdiags([em1 e0 e1],[-1 0 1],N-1,N-1);

%Setting up the Stot matrix
e = ones(M,1);
%Stot = S + S'
Stot = spdiags([e e zeros(M,1) e e],[-M+1 -1 0 1 M-1],M,M);

%Setting up the final matrix that is to be multiplied by the Stot matrix
D = diag(D);

%Using the Kronecker product to create the final matrix
C = kron(R,I)+kron(D,Stot);

%Calculate the current densities
J = current/(pi*(radius^2));

%Inside the wire the current desity is uniform but outside the wire the
%current density is zero
J_i = [J*ones((N/2)-1,1);zeros(N/2,1)];

%The matrix for the boundary condition is created
y = -mu*kron(J_i,ones(M,1));

%Implement Gauss-Seidel to solve for magnetic vector potential in z
%direction
A3 = GaussSeidel(C,y);

%Error Checking: To ensure the correct values were outputted from function.
if (nargout ~= 1), error('Incorrect number of output arguments.'); end

end

