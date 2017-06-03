%Magnetic Field Interface
%Author: David Gormley
%Created: 24/05/17

%Set the range of the radial and the angular indices and the radius of the
%wire
N = 16;
M = 16;
radius = 1;

%Find the magnetic vector potential
A = magneticVectorPotential(M,N,radius);

%Find the magnetic field
B = magneticField(A,M,N,radius);

%Plotting the results of the magnetic field
magneticFieldPlot(B,M,N,radius);