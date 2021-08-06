%This is a script to simulate the voltage, current, power, and energy
%across a capacitor in a linear circuit as it varies with time and plot each one, 
%in a simplified fashion

%User only has to input capacitance and voltage

%iAs of 8/5/21, cap voltage function can be of any form
%Linear or nonlinear polynomial, exponential, etc I believe
%Have not yet implemented piecewise analysis

clear;
clc;

syms V(x);

t = linspace(1,50,50);

C = input("What is the capacitance of the capacitor?\n");

V(x) = input("What is the capacitor voltage as a function of x?\n");
dV(x) = diff(V(x));

V_numerical = zeros(1,50);

for x = t(1):t(numel(t))
    
    V_numerical(x) = V(x);
    
end

V_numerical = double(V_numerical);

dV_numerical = zeros(1,50);

for x = t(1):t(numel(t))
    
    dV_numerical(x) = dV(x);
    
end

dV_numerical = double(dV_numerical);

subplot(2,2,1);
plot(t,V_numerical);
title('Voltage Across Capacitor vs. Time');
xlabel('Time (s)');
ylabel('Voltage (V)');

I = zeros(1,50);

for i = t(1):t(numel(t))
    
    I(i) = C.*dV_numerical(i);
    
end

subplot(2,2,2);
plot(t,I);
title('Current Across Capacitor vs. Time');
xlabel('Time (s)');
ylabel('Current (A)');

pwr = zeros(1,50);

for i = t(1):t(numel(t))
    
    pwr(i) = I(i) * V_numerical(i);
    
end

subplot(2,2,3);
plot(t,pwr);
title('Power Across Capacitor vs. Time');
xlabel('Time (s)');
ylabel('Power (W)');

w = zeros(1,50);

for i = t(1):t(numel(t))
    
    w(i) = 0.5 * C * (V_numerical(i))^2;
    
end

subplot(2,2,4);
plot(t,w);
title('Energy Across Capacitor vs. Time');
xlabel('Time (s)');
ylabel('Energy (J)');
