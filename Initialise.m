function [Theta,alpha,epsilon,Iteration] = Initialise(hypothesis)
Theta = zeros(3,1);
epsilon = 0.00001;
if(hypothesis == 1)
%LearningRate: alpha
alpha = 0.1;
%Iteration = 8000;
Iteration = 1000;
end
if(hypothesis == 2)
alpha = 0.1;
%Iteration = 1000;
Iteration = 3700;
end
if(hypothesis == 3)
alpha = 0.1;
Iteration = 5000;
%Iteration = 1000;
end
end