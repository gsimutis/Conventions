% a 2-D version with random pick of the 'friends'
% 16 players with t memory, eps probability of mistake
% We use strings 'L' and 'R'
%
% The game proceeds by a player first picking a number of friends at random
% Then randomly picking 3 'stories' (samples) from each friend and then
% making a decision.
%
% The player considers his own information and that of his friends equally
% good, therefore, we allow the player to also choose himself for
% information

players = 16; %number of players
t = 1; % number of encounters kept in memory
friends = 4; % number of friends to consult before making a decision
samples = 1; % number of encounters probed to make a decision
eps = 0.1; % probability of mistake
periods = 100000; % number of periods to be played

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% initial conditions 0 = L, 1 = R
start = 'L';
W = {}; % the world
for i = 1:players
    W{i}(1:t)=start;
end

W


% start the game
for i = 1: periods
    
    %Which player makes a decision
    p = randi(players,1);
    
    %step 1: find the best choice
    
    %choose which friends to ask
    f = randi(players,friends,1);
    
    %keep count and see which choice is statistically better
    sumL = 0;
    sumR = 0;
    
    for ff = 1:friends
        
    
    %choose which encounters to probe
    a = randi(t,samples,1);
    
      for j = 1:samples
        % Check the first player
        if strcmpi(W{ff}(a(j)),'L')
            sumL = sumL +1;
        elseif strcmpi(W{ff}(a(j)),'R')
            sumR = sumR +1;
        end

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
        Choice = BC;
    else
        Choice = WC;
    end
    
    %step 3: update the hystory
    for i = 1:t-1
        W{p}(i) = W{p}(i+1);
    end
    W{p}(t) = Choice;
end

%See what is the current state
W


