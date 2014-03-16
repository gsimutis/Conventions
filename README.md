# MATLAB Spring 2014 – Research Plan
> * Group Name: guys on the hill
> * Group participants names: Josef Neff and Gediminas Simutis
> * Project Title: Conventions

## General Introduction
Much of what we do in our everyday lives is governed by convention. Namely, there are often many equally-good ways to perform certain tasks; however, we cling to a particular form of execution. The most-studied example – driving on the left or right-hand side of the road is the starting point of our project with other examples to be studied later. There is a spread of both choices in the world with historical emergence stemming from gradual accretion of precedent and orders from central authority as pointed by Young [1]. 
The aforementioned author has also suggested a mechanism that drives the emergence of conventions based on the local interactions and history. We will set up an agent-based model to simulate this mechanism and study how the conventions emerge, how stable they are and what are the important parameters in the mechanism.
## The Model
In our model, the input parameters are the i) memory lifetime – how many interactions each agent remembers, ii) social information – how much information does the agent obtain from his friends and iii) importance of chance – how often does the agent just tosses a coin to make a decision instead of performing a highest-output calculation. This is a realistic abstraction since humans use information available to them and to their connections to make a decision, however, they do not always act perfectly rationally.
In addition, we will study the importance of connectivity – every agent will be placed in a neighborhood with different-strength links to different agents. This will allow us to probe the local conformity and global diversity.
The dependent variables will be the i) state of the system at a specific time and ii) the evolution of the state up to a certain time. We will measure the former by counting the agents with a particular preference at that time and the latter will be probed by seeing how the preferences changed as a function of time.
## Fundamental Questions
1)	How do the conventions emerge?
i) What are the factors needed for an emergence of the convention?
ii) Which of the factors are dominating?
2)	How stable the conventions are?
i) How long do the conventions last?
ii) How stable are they for the perturbations of the parameters?
3)	What are the interactions like?
i) Can only nearest neighbor interaction capture the problem?
ii) Is there a mean-field approach for this problem?
iii) What is the importance of dimensionality?
## Expected Results
By simulating our model, and performing the analysis of the parameter-dependence, we will immediately be able to answer the first two questions. The third question will be trickier and we will describe the problem in a mean-field approach and compare the two outcomes. Also, we will change the interconnectivity between the agents to see how the results change as we change the network properties.
## References
[1] H. P. Young, The Economics of Convention, Journal of Economic Perspectives - volume 10, number 2, p105 (1996) – we will study the exact dependence of the parameters which is not presented in the paper. Also, we will compare it with a mean-field-like picture.
## Research Methods
We will use an agent-based model to simulate the dynamics of an evolutionary game.
