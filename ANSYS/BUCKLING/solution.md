11. Calculate the buckling load for the column analytically. Remember that there are three  potential buckling modes to consider; Euler buckling, local buckling and torsion buckling.  For some cross sections combined Euler/torsion buckling could also occur.

Euler: $P_{cr} = \frac{\pi^2E \min(I_{xx}, I_{yy})}{l^2}$

Torsionnal: $P_cr = \frac{A}{I_{0s}}(GJ+\frac{\pi^2E\Gamma_R}{L^2})$
With $I_{0s} = I_{xx} + I_{yy} + A(x_s^2+y_s^2)$

Local: 
- Flange: assumption that loaded edge are simply supported, and one unloaded is free, the other is simply supported: so $K=0.38$
- Web: all edges are simply supported: $K=3.6$
Then we got
$$\sigma_{cr,flange} = 0.38E(\frac{t_f}{b})^2$$
$$\sigma_{cr,web} = 3.6E(\frac{t_w}{h})^2$$
Then $P_{cr} = \min(\sigma_{cr,flange},\sigma_{cr,web}) * A$

1.  Compare the results from your own FE-code and the analytical results.

Need to use both $I_{yy}$ and $I_{xx}$ for matlab buckling modes. And find the smallest one a each time. 
Also problem with our matlab code which compute the torsionnal buckling loads as many times as the number of elements. But I wrote it only one time for each case.
The value of the torsionnal buckling load is always the same and equal to St Venant buckling load: $P_{Cr,St-Venant} = \frac{AGJ}{I_{0,s}}$. That's why it is different from the analytical formula, which consider also Vlassov rotation.

13. When you continue with Ansys, you can use the same geometric model of the problem. Just  remember to remove the loads used in the bending case before you run the stability analysis. Apply the new load, ensure that it is placed correctly, has the right magnitude and the correct direction. In this problem the SFL command works, check the syntax in the manuals. To simplify things it is practical to apply a unit load (P = 1N). Ansys calculates a load factor (just as your Matlab FE-code) that is a multiplier of the applied load. It may be good to check that the load is applied correctly by running the problem statically, without the  buckling options, and check the total reaction load, which then should be 1N.

Note that when applying the load P to the lines at z=L, it should be distributed so that the  stress becomes equal in all three walls. Since the load is applied as load per unit length you need to take the different dimensions of the web and the flanges into account. 

In this way the total applied load is equal to P. Define P (e.g. P = 1) at the top of the file  where all other parameters are defined. Apply an /EOF command, run the problem and check the value of the reaction force FZ, using List>Results>Reaction solution, and make sure that it is equal to 1N. Once you have applied the buckling commands (§15), the reaction force is no longer available in the solution. (Why?)

14. Apply the necessary boundary conditions. 


15. To include eigenvalue buckling in the analysis you need to add the following to your input file (file).

Note that N should be a number, e.g. 5. You should preferably use the same value for N in both the BUCOPT and the MXPAND commands. A good way is to define N as a variable, and then use it as in the example above. Following the /POST1 command, the solution is  shown using:

SET, FIRST ! Activate the first mode
PLDISP, 2 ! Plots this mode together with the undeformed beam shape

When the input file has been checked and seems to be correct, solve the problem (SOLVE). 

Every time you wish to restart, click file>clear & start new and then file>read input from and choose the input file name from the list.

Go to General Postproc>Plot results>Deformed shape. This will show the buckling mode shape. The text top left on the screen gives the follow information;

STEP=1 (Load step number 1)
SUB=3 (Substep number 3, eigenvalue number 3) 
FREQ=xxxx (Eigenvalue – load factor for this substep)

Now press General Postproc>Read Results>Next step. Then go to the Plot menu on the top line and choose Replot. SUB=1 on the screen corresponds to the lowest buckling mode shape with its corresponding load factor.

16. Vary the length of the beam and compare how the buckling loads and buckling modes vary analytically, in your Matlab FE-code and in Ansys. In Ansys the length is varied by changing the variable controlling the length in the input file. You may have to change the  number of elements along the beam in order to avoid element distortion. The side aspect ratio (small side length/long side length) should preferably be within 1:4 and should not exceed 1:10. You do this best by changing the LESIZE commands. Plot the shape of the model before you run it to check the side aspect ratio.

17. Calculate the buckling loads. In Ansys they are given as load factors, i.e., multipliers of the applied load and if your applied load is 1N, then the load factor output will equal to the  calculated buckling load. There are as many buckling loads calculated as given in the BUCOPT-command and as many buckling modes as given in the MXPAND-command, so try to use the same number N in both these commands. In the example above, there are then N eigenvalues (buckling loads) and N eigenvectors (buckling modes). Each eigenvalue (buckling load) has a corresponding eigenvector (buckling mode) which then is a displacement vector, or vector of nodal displacements (including rotations and twist). This eigenvector can be plotted to examine if the buckled shape corresponds to Euler, local or torsion buckling.

18. Now you can compare all results; analytical, your own Matlab FE-code and Ansys results. Some load factors (eigenvalues) with their corresponding buckling modes will agree well and some not well at all. What makes the results good or bad? Which results are most reliable? Is any of the models complete and entirely accurate?