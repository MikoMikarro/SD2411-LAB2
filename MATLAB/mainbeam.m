%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Main Program
% Beam FE-code for bending about 1-axis and St.Venant torsion
%
% Use SI units only
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all;
close all;
% Definitions and input data
L=1.0;		% Length [m]
E=70000 * 10^6;	    % Youngs modulus [N/m2]
v = 0.3 ; %Poisson ratio
t_w = 1 / 1000;  % Thickness off wall [m]
t_f = 3 / 1000;  % Thickness of flange [m]
h = 60 / 1000;    % Wall height [m]
b = 20 / 1000;    % Flange length [m]
ro=1;	% Material density [kg/m3]

% Derived values
xi_s = t_f * b^2/(2*(b * t_f + (t_w*h/6))); % Shear center [m]
G=E/(2*(1+v));	    % Shear modulus [N/m2]
I=(b * t_f * h^2 * 0.5) + (h^3 * t_w / 12);		% Moment of inertia about x-axis [m4]
xc = t_f*b^2/(t_w*h+t_f*b*2); %x-position of the centroid
xs = xc+xi_s;

Iyy = t_w*h*xc^2 + t_f*b^3/6 + 2*t_f*b*(b/2-xc)^2;     % Moment of inertia about y-axis [m4]
J=2*b*t_f^3 / 3 + h*t_w^3 / 3;		% Torsional constant [m4]
EI=E*I;		% Bending stiffness [Nm2]
GJ=G*J;		% Torsional stiffness [Nm2]
A=2*b*t_f + h*t_w;	% Cross-section area [m2]
I0 = I+Iyy+A*xs^2;	% Polar moment of inertia [m4]
J0=I0*ro;	% Mass moment of inertia [kgm]


% Loads and masses
m=A*ro;	% mass per unit length of elements [kg/m]
q=0;           % Distributed load [N/m]
qt=0;		% Distributed torque [Nm/m]
S=-100;           % Concentrated load at end of beam [N]
T=S*xi_s;		% Beam end torque [Nm]
P=0;		% Buckling load [N]

% Element input data
nelem=30;		% number of elements
le=L/nelem;		% length of elements for even distribution
ndof=3*(nelem+1);	% number of degrees of freedom
nnode=nelem+1;		% number of nodes

% Node coordinates
node_z=zeros(nnode,1);
for i=1:nnode
    node_z(i)=le*(i-1);
end

% Assemble stiffness, load and initial stress matrix of the system
[K,Q,M,Ksigma]=assemble(le,EI,GJ,I0,A,J0,q,qt,S,T,m,P,ndof,nelem);

% Apply boundary conditions
% Remove locked dofs at x=0
% K,Q,M and Ksigma are now reduced and structural matrices formed
Ks=K(4:ndof,4:ndof);
Qs=Q(4:ndof);
Ms=M(4:ndof,4:ndof);
Ksigmas=Ksigma(4:ndof,4:ndof);

% Solve beam bending and torsion equation and present results

[defl,teta,fi,wmax,tmax,fimax]=bending(Ks,Qs,K,Q,nnode,node_z);

disp(["deflection at end point:" defl(end)*1000])
disp(["rotation at end point:" teta(end)*1000])
disp(["twist at end point:" fi(end)])
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Solve beam buckling equation and plot results
% The torsional buckling modes will all give identical load factors
% pb is a matrix containing the buckling load factors, in ascending order
% ub is a matrix of corresponding buckling modes (as columns)
% (Column i of ub is buckling mode of buckling load (i,i) in pb)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[pb,ub]=buckle(Ks,Ksigmas,nnode,node_z);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Analytical results
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Q 1

u_L = 0.0;
v_L = S * L^3/(3*E*I);
theta_L = -S * xi_s * L / (G*J);

disp("u Displacement at L [mm]");
disp(u_L*1000);
disp("v Displacement at L [mm]");
disp(v_L*1000);
disp("theta Displacement at L [rad]");
disp(theta_L);

shearflow(-S, I, t_f, h, t_w, b);

figure;
y = linspace(0,h, 100);
sigma_z_half = -S*L/(2*I)*y;
plot(y, sigma_z_half)
xlabel("y")
ylabel("\sigma_z")
grid("on")

work = 0.5 * S * v_L*1000 + 0.5*T*theta_L;
disp("work of the applied load at L [N.m]")
disp(work)

warping(xi_s, T, G, J, h, b)

L = 0.5;
pcr = pi^2*E*min(I,Iyy)/L^2/4;
disp("L = 500mm")
disp("Euler:")
disp(pcr)
disp("Torsionnal")
disp(torsion_buckling(I0, G,J,E,L ,b, h, t_f, t_w, xi_s))
disp("Combined")
combined_buckling(E, I, Iyy, I0, GJ,L ,b, h, t_f, t_w, xi_s, A, xs)

L = 1;
pcr = pi^2*E*min(I,Iyy)/L^2/4;
disp("L=1000mm")
disp("Euler:")
disp(pcr)
disp("Torsionnal")
disp(torsion_buckling(I0, G,J,E,L ,b, h, t_f, t_w, xi_s))
disp("Combined")
combined_buckling(E, I, Iyy, I0, GJ,L ,b, h, t_f, t_w, xi_s, A, xs)

L = 2;
pcr = pi^2*E*min(I,Iyy)/L^2/4;
disp("L=2000mm")
disp("Euler")
disp(pcr)
disp("Torsionnal")
disp(torsion_buckling(I0, G,J,E,L ,b, h, t_f, t_w, xi_s))
disp("Combined buckling")
combined_buckling(E, I, Iyy, I0, GJ,L ,b, h, t_f, t_w, xi_s, A, xs)



local_buckling(h,b,t_f,t_w,E,A)

