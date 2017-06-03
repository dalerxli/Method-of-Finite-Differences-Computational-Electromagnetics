function [] = magneticFieldPlot(B,M,N,radius)
%magneticFieldPlot(B,M,N,radius): This function will visualise the data for
%the magentic field in a 3D plot of the current carrying wire
%   Input B = data from the magnetic field
%   Input M = number of angular steps.
%   Input N = number of radial steps.
%   Input radius = radius of the current carrying wire.

%   Version 1: created 23/05/17. Author D. Gormley
%   This MATLAB function visualises the magnetic field inside and around a
%   current carrying wire.

%=========================================================================%
%Error Checking: To ensure the correct values were inputted into function.
if (nargin ~= 4), error('Incorrect number of input arguments.'); end

%Setting up the index
m = [0:(M-1)];      %Index for angle
i = [1:(N-1)];      %Index for radius

%Setting up the step size for radius and angle
h = (4*radius)/(2*N-1); %radial step
Delta = (2*pi)/M;       %angular step

%Radius redifened to avoid the diffculties of dividing by zero
r_i = (i-0.5)*h;

%Get X and Y components of B-field
theta1 = [pi/2:Delta:5*pi/2-Delta]';
theta1 = repmat(theta1,N-1);
B_x = B.*cos(theta1(:,1));
B_y = B.*sin(theta1(:,1));

%Get appropriate x and y coordinates 
theta2 = [0:Delta:2*pi-Delta]';
theta2 = repmat(theta2,N-1);
r_i = repmat(r_i,N,1);
r_i = r_i(:);

%Getting x and y coordinates based on trigonometry
X = r_i.*cos(theta2(:,1));
Y = r_i.*sin(theta2(:,1));
figure;
quiver(X,Y,B_x,B_y,0.5,'color',[1 0 0]);
title('Magnetic Field of Current Carrying Wire');
xlabel('Radial Distance (Arbitrary Units)');
ylabel('Radial Distance (Arbitrary Units)');

%Getting a 3D model by using quiver3
height = 10;
Z = [1:height].*ones((N-1)*M,1)
Z = Z(:)
X = repmat(X,[height,1])
Y = repmat(Y,[height,1])
B_z = zeros(((N-1)*M)*height,1);
B_x = repmat(B_x,[height,1]);
B_y = repmat(B_y,[height,1]);

figure;
quiver3(X,Y,Z,B_x,B_y,B_z,'color',[1 0 0]);
title('Three Dimensional Magnetic Field of Current Carrying Wire');
xlabel('Radial Distance (Arbitrary Units)');
ylabel('Radial Distance (Arbitrary Units)');
zlabel('Axial Distance (Arbitrary Units)');

end