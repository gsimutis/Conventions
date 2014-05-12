# Code Folder 

The following basic scripts are deposited in this folder. Only the versions where we look into initial and final states are put here for clarity. For studying the parameter dependence, we have expanded these scripts and they ae located in /code/analysis folder:

simple.m - The simple model described in the beginning of the paper by Young.

oneD_nn.m - One dimensional 'world' with nearest neighbours interaction

twoD_random.m - Two dimensional 'world' with random interaction.

twoD_nn.m - Two dimensional 'world' on a square lattice with nearest neighbour interactions.

twoD_nn_network.m - two dimensional 'world' where we can adjust the connectivity using "nearestNlinks" function. In particular, we look in two well-conected regions which are also connected between them with different number of links.

Functions used:

nearestN - function describing the connectivity for two_nn.m script

nearestNlinks.m - connectivity description for the twoD_nn_network.m

countmember.m - downloaded from Matlab file-exchange, as described in the header
