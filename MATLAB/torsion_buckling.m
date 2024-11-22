function pcr = torsion_buckling(I0, G,J,E,L ,b, h, tf, tw, xi)
% xc = tf*b^2/(tw*h+tf*b*2);

gamma = tw*xi^2*h^3/12 + tf*h^2/2*(xi^2*b-xi*b^2+b^3/3);
A = 2*(b*tf + h/2*tw);


pcr = A/I0*(G*J+pi^2*E*gamma/4/L^2);
disp("st venant")
disp( A/I0*(G*J))
