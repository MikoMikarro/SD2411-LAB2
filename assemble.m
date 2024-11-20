function [K,Q,M,Ksigma]=assemble(le,EI,GJ,I0,A,J0,q,qt,S,T,m,P,ndof,nelem);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Assemble system stiffness matrix, load vector, mass matrix (not necessary)
% and initial stress matrix
% File name: assemble.m
%
% K		System stiffness matrix
% Q		System load vector
% M		System mass matrix
% Ksigma       System initial stress matrix
%
% le		element length [m]
% EI		element bending stiffness [Nm2]
% GJ		element torsional stiffness [Nm2]
% I0		element polar moment of inertia [m4]
% A		element cross-section area [m2]
% J0		element mass moment of inertia [kgm]
% q		element transverse pressure load [N/m]
% qt		element torsion pressure load [Nm/m]
% S		transverse point load [N]
% T		local torque [Nm]
% m		element mass per unit length [kg/m]
% P		applied buckling load [N], positive if tensile
% ndof		number of degrees of freedom
% nelem		number of elements
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

K=zeros(ndof);
Q=zeros(ndof,1);
M=zeros(ndof);
Ksigma=zeros(ndof);

Kel = elk(le, EI, GJ);
ndof_el = ndof  / (nelem + 1);
for el = 1:nelem
    i0 = ((el-1)*ndof_el)+1;
    i1 = i0 + size(Kel, 1) - 1;
    K(i0:i1, i0:i1) = ...
        K(i0:i1, i0:i1) + Kel;
end

Ksigma_el = elksigma(le, P, I0, A);
for el = 1:nelem
    i0 = ((el-1)*ndof_el)+1;
    i1 = i0 + size(Ksigma_el, 1) - 1;
    Ksigma(i0:i1, i0:i1) = ...
        Ksigma(i0:i1, i0:i1) + Ksigma_el;
end

Q_el = elq(le, q, qt);
for el = 1:nelem
    i0 = ((el-1)*ndof_el)+1;
    i1 = i0 + size(Q_el, 2) - 1;
    Q(i0:i1) = Q(i0:i1) + Q_el';
end

M_el = elm(le, m, J0);
for el = 1:nelem
    i0 = ((el-1)*ndof_el) + 1;
    i1 = i0 + size(M_el, 1) - 1;
    M(i0:i1, i0:i1) = ...
        M(i0:i1, i0:i1) + M_el;
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Add concentrated loads
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Q(ndof - 2) = Q(ndof - 2) + S;
Q(ndof) = Q(ndof) + T;