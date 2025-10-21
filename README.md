# The-Role-of-Reteird-Battery-in-Power-System
Program Description

The program runs in the MATLAB environment using the YALMIP toolbox, and calls the Gurobi solver for optimization.

The file optimiz03 is the main program. result_calcalation is used for organizing, summarizing, and performing related calculations after the program finishes running. The other .m files are subfunctions (subprograms) that are automatically called within the main program.

Files with the data suffix contain typical daily curve data, provided by Professor Zhang Ning.

new_data1 and piecewise1 contain various data required for problem-solving and the linearized VRE (Variable Renewable Energy) cost curve data, respectively. City order includes data such as the ambient temperatures of different cities and battery degradation rates.

DegradPolicy, EncouPolicy, and TransPolicy are programs corresponding to retirement policies, deployment policies, and transportation policies, respectively. The numbers in the suffixes represent different policy scenarios.

SOH_coeff, SLB_year, SLB_RTE, SLB_N, and P_BESS are data files for the SOH (State of Health) degradation conversion coefficient, battery operational lifespan, battery charge/discharge efficiency, battery cycle numbers, and the basic data on battery SOH and cycle numbers, respectively.

We apologize that, due to security considerations, some data in "new_data_1.xlsx" are temporarily withheld from public release. 
