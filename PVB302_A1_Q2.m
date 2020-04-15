%---------------------------------------%
% PVB301 - Assignment 1: Thermodynamics %
% Author: Waldo Fouche, n9950095        %
%---------------------------------------%
clear; % Testing only

% Question 2 - Coupled Einstein Solids
% Paramaters:
Na = 250;
Nb = 250;
qtotal = Na + Nb;

% Testing only
qA = 1;
qB = 499;

% Define Arrays:
%qA = 0:1:Na;    %0 - Na incremnting by 1
%qB = Nb:-1:0;   %Nb - 0 incremnting by 1

% Turn the following into For Loops

% Omega Calculations:

OmegaA = omega(qA,Na);
OmegaB = omega(qB,Nb);
OmegaTotal = OmegaA + OmegaB;

% Entropy Calculations:

kb = 1.3806 * 10^-23; 
Sa = kb*log(OmegaA);
Sb = kb*log(OmegaB);
Stotal = Sa + Sb;

% --------------------------------------------%
%& Plotting %%

% Multiplicty of Qa for a Qtotal of x
figure
plot(qA, OmegaTotal);
xlabel('qA');
ylabel('Multiplicty');
title('Multiplicty of Qa for a Qtotal of x');

% Entropy in a System with a Qtotal of x
figure
plot(qA,Sa,qA,Sb,qA,Stotal);
xlabel('qA');
ylabel('Entropy (In units of Kb)');
title('Entropy in a System with Qtotal of x');


% Function Definitions 
function f = omega(q,N)
    n = q + N -1;
    k = N-1;
    f = nchoosek(n,k);
end