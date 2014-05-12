function A = nearestN(x)
% Input x - the number of the player
% Output A - vector with the numbers of neighbours
% In this function we define the actual structure
% 1 - 2 - 3 - 4
% |   |   |   |
% 5 - 6 - 7 - 8
% |   |   |   |
% 9 - 10- 11- 12
% |   |   |   |
% 13- 14- 15- 16

Structure = {[2;5] [1;3;6] [3;4;7] [3;8]...
    [1;6;9] [2;5;7;10] [3;6;8;11] [4;7;12] ...
    [5;10;3] [6;9;11;14] [7;10;12;15] [8;11;16] ...
    [9;14] [10;13;15] [11;14;16] [12;15]};

A = Structure{x};
