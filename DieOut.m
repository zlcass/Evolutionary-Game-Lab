function Agent = DieOut( Payoff,Agent,Siz )
VPayoff = Payoff(:); % vectorize
SVPayoff = sort(VPayoff);

% die-out
DieNum = round(3/100*Siz^2);
die = SVPayoff(DieNum);
I = find(Payoff <= die); % the death list:where the doomed placed in Payoff
K = length(I);

% if K>DieNum
%     K=DieNum;
% end
[i,j] = ind2sub([Siz,Siz],I);
% disp("the dieout points:")
Iij = [i j];
%%
mmA = mean(mean(Agent));

if K>DieNum
    rpK = randperm(K,DieNum);
else
    rpK = randperm(K);
end

for k = rpK
    Agent(Iij(k,1),Iij(k,2)) = mmA;
end
%%


end