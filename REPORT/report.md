# Bending

1. Complete the following table:

| Tool         | Horizontal displ. $u(L)$ | Vertical displ. $v(L)$ | Twist $\phi(L)$ |
| ------------ | ------------------------ | ---------------------- | --------------- |
| MatLab       | 0                        | -3.7793                | -0.0838         |
| ANSYS/ABAQUS | 0.51032E-006             | -4.5552                | -0.0837         |
| Analytical   | 0                        | -3.7793                | -0.0838         |


> NOTE!: The displacement in the ansys is greater because on the matlab / analytica the extra displacement due to the twist from the shear center was not taken into account. The real value: $v = -3.7793  +  \xi_s \sin (\phi) = -4.4983$. The use of this displacement would give the correct value

2. Give results for the following codes
- The total strain energy from the commercial FE code is: `227.51`
- The work of the applied load in the commercial FE code is: `227.80`
- The corresponding work in the MatLab code is: `188.93`

$$M_z = -0.8571$$

$$W = \frac{1}{2}  v S_y + \frac{1}{2} \phi M_z$$

3. Plot and print the shear stress distributions requested in task 7 in the lab instructions. Add your analytically calculated shear stress distribution (τ=q/t) to the plot (by hand if you like) and compare the solutions.

> NOTE! The value at the edges is not 0 as ansys gets the maximum shear stress at the surface and this exists due to the existence of torsion.

Everything on the solution folder 3

4. Plot and print the warping and normal stress distributions requested in tasks 8 and 9 in the lab instructions. Add your analytical results and compare the solutions.

> NOTE! The values at the plot of matlab are not accurate as they dont represent the real values for the warping W. You need to take into account that the edge is at an angle at the edge and therefore it would neet to be rotated back

> NOTE! The stress is not linear at the end because the boundary conditions don't allow for correct stress distribution. Also there can be some local beniding on the sides that can create the "noise". At the beginning the stress is really different because the boundary conditions don't allow for free torsion, making the stress due to warping more significant and it is not only normal stress that is taken into account

Everything on the solution folder 4

# Buckling

The critical buckling load for the beam is estimated. Results are derived analytically, with the commercial FE code and with the MatLab code, which should be modified for this task. For the FE results, examine (at least) the 5 first critical buckling loads and try to distinguish which buckling modes they represent. Complete the following table:


| Pcr [N]        | L = 500 mm | L = 1000 mm | L = 2000 mm |
| -------------- | ---------- | ----------- | ----------- |
| **Analytical** |            |             |             |
| Euler (E)      |    5527    |     1381.7  |      345.44 |
| Torsion (T)    |   25028    |    14113    |    11385    |
| Local (L)      |   12600    |    12600    |    12600    |
| Combined (C)   |   23050    |    11251    |     4668.9  |
| **FEM**        |            |             |             |
| Pcr1 (mode)    |    5404.96 |     1379.71 |      345.63 |
| Pcr2 (mode)    |   10470.82 |     7980.25 |     3096.33 |
| Pcr3 (mode)    |   11900.18 |    10932.97 |     4449.60 |
| Pcr4 (mode)    |   21572.67 |    13097.13 |     8459.64 |
| Pcr5 (mode)    |   21590.25 |    15946.05 |     9918.83 |
| **MatLab**     |            |             |             |
| Pcr1 (mode)    |    5526.98 |     1381.74 |      345.44 |
| Pcr2 (mode)    | 10475.43(T)|  10475.43(T)|     3108.93 |
| Pcr3 (mode)    |   49742.85 |    12435.71 |     5440.62 |
| Pcr4 (mode)    |   87049.91 |    21762.48 |     8635.96 |
| Pcr5 (mode)    |  138175.39 |    34543.84 | 10475.43 (T)|
____

| Pcr [N]        | L = 500 mm | L = 1000 mm | L = 2000 mm |
| -------------- | ---------- | ----------- | ----------- |
| **FEM**        |            |             |             |
| Pcr1 (mode)    | BENDING    | BENDING     | BENDING     |
| Pcr2 (mode)    |  TORSION*  | COMBINED    | BENDING     |
| Pcr3 (mode)    |  LOCAL     | BENDING*    |  COMBINED   |
| Pcr4 (mode)    |   LOCAL    | BENDING     | BENDING*    |
| Pcr5 (mode)    |   LOCAL    | TORSION     | COMBINED    |
| Pcr6 (mode)    |  LOCAL     |    LOCAL    | LOCAL*      |
| Pcr7 (mode)    |   LOCAL    |    LOCAL    | TORSION*    |
| Pcr8 (mode)    |   LOCAL    |    LOCAL    | TORSION     |
| Pcr9 (mode)    |   LOCAL    |    LOCAL    | BENDING     |
| Pcr10 (mode)   |   LOCAL    |    LOCAL    | BENDING     |