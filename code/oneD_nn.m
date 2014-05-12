clear all;
close all;
% a 1-D version with interaction only with nearest neighbours
% 16 players with t memory, eps probability of mistake
% We use strings 'L' and 'R'
%
%
% The player considers his own information and that of his friends equally
% good, therefore, we allow the player to also choose himself for
% information

Seed = 10;
RandStream.setDefaultStream(RandStream('mt19937ar','seed',Seed))

players = 16; %number of players
t = 8; % number of encounters kept in memory
samples = 2; % number of encounters probed to make a decision
eps = 0.1; % probability of mistake
periods = 2000000; % number of periods to be played

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% initial conditions random
W = {}; % the world
for i = 1:players
    for moment = 1:t
        
         coin = rand;
         if coin <0.5
            start = 'L';
         else
            start = 'R';
         end
    W{i}(moment)=start;
    end
end


% start the game
for i = 1: periods

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%%%%%%%% Decision making          %%%%%%%%%%%%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    %Which player makes a decision
    p = randi(players,1);
    
    %step 1: find the best choice
    
    %If the players are at the end of a chain, they only have one neighbour
       if p == 1
         start = 0;
         stop = 1;
       elseif p == players
         start = -1;
         stop = 0;
       else
         start = -1;
         stop = 1;
       end
    %keep count and see which choice is statistically better
    sumL = 0;
    sumR = 0;
    
    for ff = start:stop
        
    
    %choose which encounters to probe

    a = randi(t,samples,1);

    
      for j = 1:samples
        % Check 
        if strcmpi(W{p+ff}(a(j)),'L')
            sumL = sumL +1;
        elseif strcmpi(W{p+ff}(a(j)),'R')
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
    for updt = 1:t-1
        W{p}(updt) = W{p}(updt+1);
    end
    W{p}(t) = Choice;
    

    %if rem(i,1000) == 0
        %i
        %print result every 1000 iterations
        %W
    %end


end
% See what the latest configuration looks like
W
