function [B,start,stop] = curlOfA3(A3,start,stop,h,N)
%[B] = curlOfA3(A3,start,end): Calculates the curl of A3 to find the
%magnetic field.
%   Input A3 = magnetic vector potential
%   Input start = the start of the range that applies central
%   difference without special edge cases
%   Input stop = last value of the range that applies central difference
%   without special edge cases.
%   Input h = radial step
%   Input N = range of indices
%   Output B = magnetic field
%   Output start = new start value for next function call
%   Output stop = new stop value for next function call

%   Version 1: created 24/05/17. Author D. Gormley
%   This MATLAB function calculates the curl of the magnetic vector
%   potential.

%=========================================================================%

%Error Checking: To ensure the correct values were inputted into function.
if (nargin ~= 5), error('Incorrect number of input arguments.'); end

%Setting up the indices, i will vary for the different values of A3 while
%the j will remain constant for B
i = [start:stop];
j = [2:(N-1)];

%Using the method of central differences to calculate the magnetic field
B(j) = -(A3(i+1)-A3(i-1))/(2*h);

%Special consideration given to i = 1 and i = N
B(1) = -(A3(start)-A3(start-1))/(h);
B(16) = -(A3(stop+1)-A3(stop))/(h);

%Iterating for the next values of start and stop
start = start + N;
stop = stop + N;

%Error Checking: To ensure the correct values were outputted from function.
if (nargout ~= 3), error('Incorrect number of output arguments.'); end

end

