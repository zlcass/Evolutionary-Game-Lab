
%diagonal spreadout 
function Agent = SpreadOut( Payoff,Agent,Siz,rd)
VPayoff = Payoff(:);
SVPayoff = sort(VPayoff);
SprNum = round(3/100*Siz^2);
SpreadThreshold = SVPayoff(Siz^2-SprNum+1);
I = find(Payoff >= SpreadThreshold); % the spread list
K = length(I);

[i,j]=ind2sub([Siz,Siz],I);
Iij=[i j];
randrow = randperm(size(Iij,1));

% disp("the spreadout points:")
Iij = Iij(randrow(1:K),:);

AugAgent = zeros(Siz+2);
AugAgent(2:Siz+1,2:Siz+1) = Agent;

AugAgent(1,:) = AugAgent(Siz+1,:);
AugAgent(Siz+2,:) = AugAgent(2,:);
AugAgent(:,1) = AugAgent(:,Siz+1);
AugAgent(:,Siz+2) = AugAgent(:,2);

if K>SprNum
    rpK = randperm(K,SprNum);
else
    rpK = randperm(K);
end

for k = rpK
    Iij(k,1) = Iij(k,1)+1;
    Iij(k,2) = Iij(k,2)+1;
    %augment matrix index change 
    if AugAgent(Iij(k,1),Iij(k,2)) < 0
        AugAgent(Iij(k,1)-1,Iij(k,2)-1) = 1/2*(AugAgent(Iij(k,1)-1,Iij(k,2)-1)+AugAgent(Iij(k,1),Iij(k,2)));
        AugAgent(Iij(k,1)+1,Iij(k,2)-1) = 1/2*(AugAgent(Iij(k,1)+1,Iij(k,2)-1)+AugAgent(Iij(k,1),Iij(k,2)));
        AugAgent(Iij(k,1)+1,Iij(k,2)+1) = 1/2*(AugAgent(Iij(k,1)+1,Iij(k,2)+1)+AugAgent(Iij(k,1),Iij(k,2)));
        AugAgent(Iij(k,1)-1,Iij(k,2)+1) = 1/2*(AugAgent(Iij(k,1)-1,Iij(k,2)+1)+AugAgent(Iij(k,1),Iij(k,2)));
    else
        AugAgent(Iij(k,1)-1,Iij(k,2)) = 1/2*(AugAgent(Iij(k,1)-1,Iij(k,2))+AugAgent(Iij(k,1),Iij(k,2)));
        AugAgent(Iij(k,1)+1,Iij(k,2)) = 1/2*(AugAgent(Iij(k,1)+1,Iij(k,2))+AugAgent(Iij(k,1),Iij(k,2)));
        AugAgent(Iij(k,1),Iij(k,2)-1) = 1/2*(AugAgent(Iij(k,1),Iij(k,2)-1)+AugAgent(Iij(k,1),Iij(k,2)));
        AugAgent(Iij(k,1),Iij(k,2)+1) = 1/2*(AugAgent(Iij(k,1),Iij(k,2)+1)+AugAgent(Iij(k,1),Iij(k,2)));
    end
    
    if Iij(k,1) == 2
        AugAgent(Siz+1,:) = AugAgent(1,:); % Siz+1 row = 1st row
    elseif Iij(k,1) == Siz+1
        AugAgent(2,:) = AugAgent(Siz+2,:); % 2ed row = Siz+2 row
    end
    
    
    if Iij(k,2) == 2
        AugAgent(:,Siz+1) = AugAgent(:,1); % Siz+1 col = 1st col
    elseif Iij(k,2) == Siz+1
        AugAgent(:,2) = AugAgent(:,Siz+2); % 2ed col = Siz+2 col
    end
end

% disp(AugAgent)
Agent = AugAgent(2:Siz+1,2:Siz+1);
Agent(Agent > rd) = rd;
Agent(Agent < -rd) = -rd;

