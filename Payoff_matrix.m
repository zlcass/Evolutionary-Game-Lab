function Payoff = Payoff_matrix(Agent,Siz,rd)

AugPayoff = zeros(Siz+2);

AugAgent = zeros(Siz+2);
AugAgent(2:Siz+1,2:Siz+1) = Agent;
AugAgent(1,:) = AugAgent(Siz+1,:);
AugAgent(Siz+2,:) = AugAgent(2,:);
AugAgent(:,1) = AugAgent(:,Siz+1);
AugAgent(:,Siz+2) = AugAgent(:,2);

for j = 1:Siz
    for i = 1:Siz
        Action = game(AugAgent(i+1,j+1),AugAgent(i+1,j+1+1),rd);
        sum_payoff = sum(payoff(Action,rd));
		AugPayoff(i+1,j+1) = AugPayoff(i+1,j+1) + sum_payoff(1);
        AugPayoff(i+1,j+1+1) = AugPayoff(i+1,j+1+1) + sum_payoff(2);
    end
end
%AugPayoff(:,2) = AugPayoff(:,2) +  AugPayoff(:,Siz+1) - OrigAug(:,Siz+1);
% there is an error!!! the last colum update should be counted on the first
% row

for j = 1:Siz
    for i = 1:Siz
        Action = game(AugAgent(i+1,j+1),AugAgent(i+1+1,j+1),rd);
        sum_payoff = sum(payoff(Action,rd));
		AugPayoff(i+1,j+1) = AugPayoff(i+1,j+1) + sum_payoff(1);
        AugPayoff(i+1+1,j+1) = AugPayoff(i+1+1,j+1) + sum_payoff(2);
    end
end
AugPayoff(2,:) = AugPayoff(2,:) + AugPayoff(Siz+2,:);
AugPayoff(:,2) = AugPayoff(:,2) + AugPayoff(:,Siz+2);
Payoff = AugPayoff(2:Siz+1,2:Siz+1);

end

