%---------------------------------------%
% PVB301 - Assignment 1: Thermodynamics %
% Author: Waldo Fouche, n9950095        %
%---------------------------------------%
clear; % Testing only

% Question 1 
% System of 10 trials 
m = 10; % # of trials
n = 15; % # of 
M = randi(2,m,n) -1; % Gemerates a m x n matrix of random 0's and 1's

% Sum rows of matrix to form macrostate:
sum_M = sum(M,2);

% Average Macrostate Value:
mean = mean(sum_M);
disp(mean);

% Std Deviation of Macrostate:
std = std(sum_M);
disp(std);

% Normalise the Macrostate histogram:
histogram(sum_M, 'normalization', 'probability');

% Label the graph %
title({'Macrostate Distribution', 'for a system of 10 Counts'});
xlabel('Count');
ylabel('Probability');
