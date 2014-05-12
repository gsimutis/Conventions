% Simple model for conventions as described by H. Peyton Young
% in Journal of Economic Perspectives 10 2 110 (1996)
% 2 players with t memory, eps probability of mistake
% We use strings 'L' and 'R'

t = 10; % number of encounters kept in memory
samples = 3; % number of encounters probed to make a decision
eps = 0.1; % probability of mistake
periods = 10000; % number of periods to be played

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% initial conditions 0 = L, 1 = R
P1 = ['L' 'L' 'L' 'L' 'L' 'L' 'L' 'L' 'L' 'L'];
P2 = ['L' 'L' 'L' 'L' 'L' 'L' 'L' 'L' 'L' 'L'];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% start the game
for i = 1: periods
    %step 1: find the best choice
    %choose which encounters to probe
    a = randi(t,samples,1);
    %see which choice is statistically better
    sumL = 0;
    sumR = 0;
    for j = 1:samples
        % Check the first player
        if strcmpi(P1(a(j)),'L')
            sumL = sumL +1;
        elseif strcmpi(P1(a(j)),'R')
            sumR = sumR +1;
        end
        % Check the second player
        if strcmpi(P2(a(j)),'L')
            sumL = sumL +1;
        elseif strcmpi(P2(a(j)),'R')
            sumR = sumR +1;
        end
    end
    % see which choice is preffered
    if sumL > sumR
        BC = 'L';
        WC = 'R';
    elseif sumR > sumL
        BC = 'R';
        WC = 'L';
    else
        % If the number of the historical decisions is the same for R and
        % L, the player tosses a coin and chooses at random
        coin = rand;
        if coin <0.5
            BC = 'L';
            WC = 'R';
        else
            BC = 'R';
            WC = 'L';
        end
    end
    
    %step 2: see what choices the players make
    a = rand;
    if a > eps
        P1C = BC;
    else
        P1C = WC;
    end
    
    a = rand;
    if a > eps
        P2C = BC;
    else
        P2C = WC;
    end
    %step 3: update the hystory
    for i = 1:t-1
        P1(i) = P1(i+1);
        P2(i) = P2(i+1);
    end
    P1(t) = P1C;
    P2(t) = P2C;
end

% Display the current status
P1
P2
