function [defl,teta,fi,umax,tmax,fimax]=bending(Ks,Qs,K,Q,nnode,node_z);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Calculate deformed beam bending and torsion shape and plot results
% File name: bending.m
%
% Ks		Structural stiffness matrix
% Qs		Structural load vector
% K		System stiffness matrix
% Q		System load vector
% nnode		Number of nodes
% node_z	Nodal z-coordinates
%
% defl		Deflection vector of size nnodes
% teta		Rotation vector of size nnodes
% fi		Twist vector of size nnodes
% umax		Maximum deflection
% tetamax	Maximum rotation
% fimax		Maximum twist
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Solve system of equations
wf = Ks \ Qs;
% Present displacements at the free end

% Present reaction forces
Kpf = K(1:4, 4:end);
Fr = Kpf * wf;

% Create result vector containing deflections, rotations and twist
w = zeros(size(K,1),1);
w(4:end) = wf;

w = reshape(w, [3, nnode]);
% Split deflections, rotations and twist into separate vectors
defl = w(1,:);
teta = w(2,:);
fi = w(3,:);

umax = max(abs(defl));
tmax = max(abs(teta));
fimax = max(abs(fi));
% Normalise deflectons, rotations and twist and plot results
defl_n = defl / umax;
teta_n = teta / tmax;
fi_n = fi / fimax;

figure;
hold on;
plot(node_z,defl_n, 'DisplayName','deflection');
plot(node_z,teta_n, 'DisplayName','rotation');
plot(node_z, fi_n, 'DisplayName','twist');

xlabel("x")
ylabel("bending (normalized)")
legend()
grid("on")
title("Bending")
hold off;