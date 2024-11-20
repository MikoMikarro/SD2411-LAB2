# 1
NOT ANSYS
# 2
NOT ANSYS
# 3
Works fine -> Renamed X as it is not exacly a compression factor
# 4
Load applied following Appendix A
# 5
Commands
```
NSEL, S , LOC, Z, L
NSEL, R, LOC, X, 0
NSEL, R, LOC, Y, h/2
```
List -> Results -> Nodal Solution -> DOF Solution -> Displacement Vector Sum

NODE       UX               UY              UZ             USUM  
112         0.51071E-006    -4.5552         0.49801E-008   4.5552

List -> Results -> Nodal Solution -> DOF Solution -> Rotation Vector Sum
NODE       ROTX             ROTY            ROTZ           RSUM  
112         0.67050E-002    0.72555E-009    -0.88578E-001  0.88832E-001

# 6
On the main menu (left panel)
General Postproc -> Element Table -> Define Table -> Add -> Energy ->Strain enrg SENE-> OK -> Close
Then, in the same menu
General Postproc -> Element Table -> Sum of Each Item
TABLE LABEL     TOTAL
SENE            227.511    
# 7
On the toolbar
Select -> Entities -> Nodes -> By Location -> Z coordinates -> Min,Max = 490, 500 -> Apply -> Plot

On the toolbar
List -> Nodes -> Coordinates Only
 LIST ALL SELECTED NODES.   DSYS=      0
 SORT TABLE ON  NODE  NODE  NODE

   NODE        X                   Y                   Z
       70    0.00000000000         0.00000000000         493.146230580     
      190    0.00000000000         60.0000000000         493.146230580     
     1174    0.00000000000         3.00000000000         493.146230580     
     1175    0.00000000000         6.00000000000         493.146230580     
     1176    0.00000000000         9.00000000000         493.146230580     
     1177    0.00000000000         12.0000000000         493.146230580     
     1178    0.00000000000         15.0000000000         493.146230580     
     1179    0.00000000000         18.0000000000         493.146230580     
     1180    0.00000000000         21.0000000000         493.146230580     
     1181    0.00000000000         24.0000000000         493.146230580     
     1182    0.00000000000         27.0000000000         493.146230580     
     1183    0.00000000000         30.0000000000         493.146230580     
     1184    0.00000000000         33.0000000000         493.146230580     
     1185    0.00000000000         36.0000000000         493.146230580     
     1186    0.00000000000         39.0000000000         493.146230580     
     1187    0.00000000000         42.0000000000         493.146230580     
     1188    0.00000000000         45.0000000000         493.146230580     
     1189    0.00000000000         48.0000000000         493.146230580     
     1190    0.00000000000         51.0000000000         493.146230580     
     1191    0.00000000000         54.0000000000         493.146230580     
     1192    0.00000000000         57.0000000000         493.146230580     
     1691    20.0000000000         0.00000000000         493.146230580     
     2174    18.0000000000         0.00000000000         493.146230580     
     2175    16.0000000000         0.00000000000         493.146230580     
     2176    14.0000000000         0.00000000000         493.146230580     
     2177    12.0000000000         0.00000000000         493.146230580     
     2178    10.0000000000         0.00000000000         493.146230580     
     2179    8.00000000000         0.00000000000         493.146230580     
     2180    6.00000000000         0.00000000000         493.146230580     
     2181    4.00000000000         0.00000000000         493.146230580     
     2182    2.00000000000         0.00000000000         493.146230580     
     2460    20.0000000000         60.0000000000         493.146230580     
     2934    2.00000000000         60.0000000000         493.146230580     
     2935    4.00000000000         60.0000000000         493.146230580     
     2936    6.00000000000         60.0000000000         493.146230580     
     2937    8.00000000000         60.0000000000         493.146230580     
     2938    10.0000000000         60.0000000000         493.146230580     
     2939    12.0000000000         60.0000000000         493.146230580     
     2940    14.0000000000         60.0000000000         493.146230580     
     2941    16.0000000000         60.0000000000         493.146230580     
     2942    18.0000000000         60.0000000000         493.146230580     


On the toolbar
List -> Results -> Nodal Solution -> ( Different Stress values Probably shear XZ)

On the left main menu
General Postproc -> Path Operations -> Define Path
Click on the corner nodes in order and create path

then

General Postproc -> Path Operations -> Map onto Path 
General Postproc -> Path Operations -> Plot Path item On Graph

Repeat this for nodes at z = L, just remember to delete previous paths

Plot results on the media files

# 8
NOT ANSYS
# 9
NOT ANSYS
# 10
NOT ANSYS
