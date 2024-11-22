function pcr = torsion_buckling(Ixx, Iyy, G,J,E,L ,b, h, tf, tw, xi)
xc = tf*b^2/(tw*h+tf*b*2);
xs = xc+xi;

gamma = 2 * (tw^4*xi^4/16*(h/2)^5/5 +...
    h^4*tf^4/256*((-b)^5/5))

A = 2*(b*tf + h*tw);
I0 = Ixx+Iyy+A*xs^2;

pcr = A/I0*(G*J+pi^2*E*gamma/L^2)

