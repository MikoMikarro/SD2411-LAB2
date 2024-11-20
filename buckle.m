function [pb,ub]=buckle(Ks,Ksigmas,nnode,node_z);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Solve beam buckling equation
% File name: buckle.m
%
% Ks		Structural stiffness matrix
% Ksigmas	Structural inital stiffness matrix
% nnode		Number of nodes
% node_z	Nodal x-coordinates
%
% pb		Matrix with eigenvalues (load factors) in diagonal
% ub		Corresponding matrix of eigenvectors (buckling modes)
% 	(Column i of ub shows the buckling mode for buckling load (i,i) in pb)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Calculate eigenvalues and eigenvectors
[ub, pb] = eig(Ks, -Ksigmas);

% Split bending and twist modes into separate vectors

bending_due_deflection = ub(1:3:end, :);
bending_due_rotation   = ub(2:3:end, :);
bending_due_twist      = ub(3:3:end, :);

% Normalise deflections, rotations and twist for plotting purposes (without risking to mix up signs or divide by zero)

if max(bending_due_deflection) > 0
    bending_due_deflection = bending_due_deflection / max(bending_due_deflection);
end
if max(bending_due_rotation) > 0
    bending_due_rotation = bending_due_rotation / max(bending_due_rotation);
end
if max(bending_due_twist) > 0
    bending_due_twist = bending_due_twist / max(bending_due_twist);
end

% Plot buckling modes
n_mode = min(nnode, nnode);
figure();
plot(bending_due_deflection(:, 1:n_mode));
title("Buckling modes due to deflection")
xlabel("x")
ylabel("w")



figure();
plot(bending_due_rotation(:, 1:n_mode));
title("Buckling modes due to rotation")
xlabel("x")
ylabel("theta")

figure();
plot(bending_due_twist(:, 1:n_mode));
title("Buckling modes due to twist")
xlabel("x")
ylabel("twist")


% Present the buckling loads
load = pb(sub2ind(size(pb),1:size(pb,1),1:size(pb,2))); %% DIAGONAL
figure();
plot(load, 'o');
title("Loads factor for buckling")
ylabel("loads factor")
xlabel("buckling mode")
grid on