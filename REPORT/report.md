# Bending

1. Complete the following table:
                Horizontal displ. u(L)      Vertical displ. v(L)    Twist ϕ(L)
MatLab          0                           -3.7793                 -0.0838
ANSYS/ABAQUS    0.51032E-006                -4.5552                 -0.0837
Analytical      0                           -3.7793                 -0.0838

2. 
a) The total strain energy from the commercial FE code is:      227.51
b) The work of the applied load in the commercial FE code is:   227.80
c) The corresponding work in the MatLab code is:                188.93

T = -0.8571
W = 1/2 * d * F + 1/2 * ϕ * T

3. Plot and print the shear stress distributions requested in task 7 in the lab instructions. Add 
your analytically calculated shear stress distribution (τ=q/t) to the plot (by hand if you like) 
and compare the solutions.

Everything on the solution folder 3

4. Plot and print the warping and normal stress distributions requested in tasks 8 and 9 in the 
lab instructions. Add your analytical results and compare the solutions.

Everything on the solution folder 4

# Buckling

The critical buckling load for the beam is estimated. Results are derived analytically, with the 
commercial FE code and with the MatLab code, which should be modified for this task. For 
the FE results, examine (at least) the 5 first critical buckling loads and try to distinguish which 
buckling modes they represent.
Complete the following table:
Pcr [N]                 L = 500 mm      L = 1000 mm     L = 2000 mm
Analytical,
    Euler (E)
    Torsion (T)
    Local (L)
    Combined (C)
 
 FEM
    Pcr1 (mode)
    Pcr2 (mode)
    Pcr3 (mode)
    Pcr4 (mode)
    Pcr5 (mode)

MatLab
    Pcr1 (mode)
    Pcr2 (mode)
    Pcr3 (mode)
    Pcr4 (mode)
    Pcr5 (mode)