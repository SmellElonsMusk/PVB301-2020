%---------------------------------------%
% PVB301 - Assignment 1: Thermodynamics %
% Author: Waldo Fouche, n9950095        %
%---------------------------------------%
clear; % Testing only

% Question 2 - Coupled Einstein Solids
% Paramaters:  
Na = 150; % Change these values
Nb = 350; % Change These values
qtotal = Na + Nb;
kb = 1.3806 * 10^-23; 

% Define Arrays:
qA = 0:1:qtotal;    % 0 - Na incremnting by 1
qB = qtotal:-1:0;   % Nb - 0 incremnting by 1

% Define Arrays with preallocated size for efficiency
OmegaA= zeros(1,qtotal+1);
OmegaB = zeros(1,qtotal+1);
OmegaTotal = zeros(1,qtotal+1);
Sa = zeros(1,qtotal+1);
Sb = zeros(1,qtotal+1);
Stotal = zeros(1,qtotal+1);

% Compute the Values and Insert into arrays
n = 1;
while n < qtotal+1
    oA = omega(qA(n),Na);
    oB = omega(qB(n),Nb);
    
    % Omega Calculations:
    OmegaA(n) = oA;
    OmegaB(n) = oB;
    OmegaTotal(n) = OmegaA(n) * OmegaB(n);
    
    % Entropy Calculations:
    Sa(n) = kb*log(OmegaA(n));
    Sb(n) = kb*log(OmegaB(n));
    Stotal(n) = Sa(n) + Sb(n);
    
    n = n + 1;
end

% Plotting 
% Multiplicty of Qa for a Qtotal of x
figure
plot(qA, OmegaTotal);
xlabel('qA');
ylabel('Multiplicty');
%title(['Multiplicty of qA for a Qtotal of ' num2str(qtotal), ' Where Na = Nb']);
title({'Multiplicty of qA for a Qtotal of 500' , ' Where Na < Nb'});

% Entropy in a System with a Qtotal of x
figure
p1 = plot(qA,Sa); hold on; L1 = 'Sa';
p2 = plot(qA, Sb); hold on; L2 = 'Sb';
p3 = plot(qA, Stotal); L3 = 'Stotal';
xlabel('qA');
ylabel('Entropy (In units of Kb)');
%title(['Entropy in a System with Qtotal of ', num2str(qtotal),' Where Na = Nb']);
title({'Entropy in a System with Qtotal of 500',' Where Na < Nb'});
legend([p1;p2;p3], L1,L2,L3);


% Omega Function Definition
function f = omega(q,N)
    n = q + N -1;
    k = N-1;
    f = nchoosek(n,k);
end