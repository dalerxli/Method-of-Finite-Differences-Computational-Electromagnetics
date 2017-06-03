function [B] = magneticField(A3,M,N,radius)
% magneticField(A,M,N,radius): Using the method of finite
% differences, function finds the magnetic field of a current
% carrying wire that satisfies Poisson's equation based off the magnetic
% vector potential.
%   Input A3: magnetic vector potential.
%   Input M: number of angular steps.
%   Input N: number of radial steps.
%   Input radius: radius of the current carrying wire.
%   Output B: magnetic field of the wire.

%   Version 1: created 22/05/17. Author D. Gormley
%   This MATLAB function calculates the magnetic field inside a
%   current carrying wire.

%=========================================================================%

%Error Checking: To ensure the correct values were inputted into function.
if (nargin ~= 4), error('Incorrect number of input arguments.'); end

%Finding the radial components of the B field
B = ones((N-1)*M,1);

%Setting up the step size for radius and angle
h = (4*radius)/(2*N-1); %radial step - Anna has 4*radius, why?

start = 2;
stop = N-1;
i = [1:N];

for count = [1:N-1]
    [B(i),start,stop] = curlOfA3(A3,start,stop,h,N);
    i = i+N;
end

B(1:16)=B(1:16)/2.75;

%Error Checking: To ensure the correct values were outputted from function.
if (nargout ~= 1), error('Incorrect number of output arguments.'); end

end

