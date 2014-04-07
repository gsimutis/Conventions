% Simple model for conventions as described by H. Peyton Young
% in Journal of Economic Perspectives 10 2 110 (1996)
% 2 players with t memory, eps probability of mistake

t = 10; % number of encounters kept in memory
samples = 3; % number of encounters probed to make a decision
eps = 0.05; % probability of mistake
periods = 100; % number of periods to be played

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% initial conditions 0 = L, 1 = R
%P1 = [0 0 0 0 0 0 0 0 0 0];
%P2 = [0 0 0 0 0 0 0 0 0 0];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% start the game
for i = 1: periods
    %step 1: find the best choice
    %choose which encounters to probe
    a = randi(t,samples,1);
    %see which choice is statistically better
    sum = 0;
    for j = 1:samples
        sum = sum + P1(a(j)) + P2(a(j));
    end
    avg = sum/(2*samples);
    if avg < 0.5
        BC = 0;
        WC = 1;
    else
        BC = 1;
        WC = 0;
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

% Output the final configuration after a number of periods
P1
P2
