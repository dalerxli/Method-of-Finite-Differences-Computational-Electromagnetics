function [A] = magneticVectorPotential(M,N,radius)
% magneticVectorPotential(M,N,radius): Using the method of finite
% differences, function finds the magnetic vector potential of a current
% carrying wire that satisfies Poisson's equation.
%   The function will assume a DC current of 1 A.
%   Input M: number of angular steps.
%   Input N: number of radial steps.
%   Input radius: radius of the current carrying wire.
%   Output A: magnetic vector potential in the z direction inside wire.

%   Version 1: created 20/05/17. Author D. Gormley
%   This MATLAB function calculates the magnetic vector potential inside a
%   current carrying wire.

%=========================================================================%

%Internal Parameters


%=========================================================================%

%Change in radius
h = (2*radius)/((2*N)-1);





end

