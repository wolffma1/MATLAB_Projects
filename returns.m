%This is a VERY simple compound return calculator for investments,
%taking into account a few investment expenses

%Assumes Charles Schwab brokerage account, hence $49.95 transaction fee for 
%non-Schwab products

%ER = expense ratio
%TCR = tax-cost ratio

clear;
clc;

funds_cell = {};

num = input("Please enter the number of funds you'd like to compare.\n");
years_scalar = input("Please enter the number of years for which you'd like to see returns.\n");
years = 1:1:years_scalar;
P = input("What is the principal investment in question?\n");
I = input("What is the projected return rate as a decimal?\n");
C = input("What is the compounding frequency?\n");
PMT = input("What is the monthly contribution?\n");

for i = 1:num
    
    if i == 1
        funds_cell{i} = input("Please enter the ticker of the 1st fund.\n","s");
    end
    
    if i == 2
        funds_cell{i} = input("Please enter the ticker of the 2nd fund.\n","s");
    end
    
    if i == 3
        funds_cell{i} = input("Please enter the ticker of the 3rd fund.\n","s");
    end
    
    if i > 3
        fprintf("Please enter the ticker of the %dth fund.\n",i);
        funds_cell{i} = input("","s");
    end
    
end

x = categorical(funds_cell);
ER = zeros(1,num);
TCR = zeros(1,num);

for i = 1:num
    
    %   Entering expense ratios
    fprintf("Please enter the expense ratio, as a percentage, of %s.\n",funds_cell{i});
    ER(i) = input("");
    
    %   Entering TCRs
    fprintf("Please enter the tax cost ratio, as a percentage, of %s.\n",funds_cell{i});
    TCR(i) = input("");
    
end

ER = 0.01.*ER;
TCR = 0.01.*ER;

schwabYN = zeros(1,num);
ret = zeros(years_scalar,num);

for i = 1:num
    
    for j = 1:years_scalar
        
        ret(j,i) = (P.*((1 + (I/C))^(j*C))) + ((PMT*(((1 + (I/C))^(j*C))-1))/(I/C));
        
    end
    
end

%   Accounting for ER, TCR, transaction fee if any
for i = 1:num
    
    %   Accounts for ER
    ret(:,i) = ret(:,i) - (ER(i) * ret(:,i));
    
    %   Accounts for transaction fee
    fprintf("Is %s a Schwab fund? Enter Y/N.\n",funds_cell{i});
    schwabYN(i) = input("","s");
    
    if schwabYN(i) == 'N'
        ret(:,i) = ret(:,i) - 49.95;
    end
    
    % Accounts for TCR
    ret(:,i) = ret(:,i) - (TCR(i) * ret(:,i));
    
end

x = linspace(1,years_scalar,years_scalar);

for i = 1:num
    
    if i == 1
        plot(x,ret(:,i));
        title("Investment Returns Over Time");
        xlabel("Time (Years)");
        ylabel("Returns (U.S. Dollars)");
        legend(funds_cell);
    end
    
    if i ~= 1
        hold on
        plot(x,ret(:,i));
        legend(funds_cell);
        hold off
    end
    
end
