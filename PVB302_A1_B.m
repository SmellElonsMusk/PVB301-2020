%---------------------------------------%
% PVB301 - Assignment 1: Thermodynamics %
% Author: Waldo Fouche, n9950095        %
%---------------------------------------%
clear; % Testing only

% Question 1 - Part B
compartments = 15; % Compartments
up = 15; % Eyes Up
down = compartments - up; % Eyes Down

% Define Arrays:
d = transpose(0:1:compartments);   % Eyes Down 
u = transpose(compartments:-1:0);  % Eyes Up
BC = transpose(zeros(1,compartments+1)); % Store Microstates

i = 1; % Counter
m_total = 0; % Microstate Counter

% Calculate BC of Each microstate and Compute Total # of states.
while i<compartments+1
    fu = factorial(u(i));
    fd = factorial(d(i));
    fc = factorial(compartments);
    bc = fc./(fu*fd);
    BC(i) = bc;
    i = i+1;
    m_total = m_total + bc;
end 

% Display Data in Table
T = table(u,d,BC);
T.Properties.VariableNames = {'Eyes Facing Up','Eyes Facing Down','# of Microstates'};
disp(T);
disp(m_total);

