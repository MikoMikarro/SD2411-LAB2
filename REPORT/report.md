# Bending

1. Complete the following table:

| Tool         | Horizontal displ. $u(L)$ | Vertical displ. $v(L)$ | Twist $\phi(L)$ |
| ------------ | ------------------------ | ---------------------- | --------------- |
| MatLab       | 0                        | -3.7793                | -0.0838         |
| ANSYS/ABAQUS | 0.51032E-006             | -4.5552                | -0.0837         |
| Analytical   | 0                        | -3.7793                | -0.0838         |

2. Give results for the following codes
- The total strain energy from the commercial FE code is: `227.51`
- The work of the applied load in the commercial FE code is: `227.80`
- The corresponding work in the MatLab code is: `188.93`

$$M_z = -0.8571$$
$$W = \frac{1}{2}  v S_y + \frac{1}{2} \phi M_z$$
3. Plot and print the shear stress distributions requested in task 7 in the lab instructions. Add your analytically calculated shear stress distribution (τ=q/t) to the plot (by hand if you like) and compare the solutions.

Everything on the solution folder 3

4. Plot and print the warping and normal stress distributions requested in tasks 8 and 9 in the lab instructions. Add your analytical results and compare the solutions.

Everything on the solution folder 4

# Buckling

The critical buckling load for the beam is estimated. Results are derived analytically, with the 
commercial FE code and with the MatLab code, which should be modified for this task. For 
the FE results, examine (at least) the 5 first critical buckling loads and try to distinguish which 
buckling modes they represent.
Complete the following table:


| Pcr [N]        | L = 500 mm | L = 1000 mm | L = 2000 mm |
| -------------- | ---------- | ----------- | ----------- |
| **Analytical** |            |             |             |
| Euler (E)      | 5527.0     | 1381.7      | 345.4362    |
| Torsion (T)    | 14113      | 11385       | 10703       |
| Local (L)      | 12600      | 12600       | 12600       |
| Combined (C)   | 13520      | 10475       | 4610.9      |
| **FEM**        |            |             |             |
| Pcr1 (mode)    | 5404.9552  | 1379.7069   | 345.63093   |
| Pcr2 (mode)    | 10470.816  | 7980.2467   | 3096.3322   |
| Pcr3 (mode)    | 11900.177  | 10932.967   | 4449.5996   |
| Pcr4 (mode)    | 21572.674  | 13097.126   | 8459.6366   |
| Pcr5 (mode)    | 21590.254  | 15946.047   | 9918.8257   |
| **MatLab**     |            |             |             |
| Pcr1 (mode)    | 5526.9785  | 1381.744    | 345.4361    |
| Pcr2 (mode)    | 10475.433  | 10475.433   | 3108.9280   |
| Pcr3 (mode)    | 49742.848  | 12435.712   | 8635.9599   |
| Pcr4 (mode)    | 87049.911  | 21762.477   | 5440.619    |
| Pcr5 (mode)    | 138175.39  | 34543.839   | 10475.433   |

