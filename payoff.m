% R C-C reward
% T D-C temptation
% S C-D sucker
% P D-D punishment

function po = payoff(Action,rd)
T = 5; R = 3; P = 1; S = 0;
% CD1 = CD(:,1);
% CD2 = CD(:,2);
%CD1 CD2 are the Action vectors of cooperation or defection respectively
%po1 po2 are the payoff vectors respectively
po1 = zeros(rd,1);
po2 = zeros(rd,1);
% CD = randi([0,1],10,2);  
% temperary test CD
for i = 1:rd
    PlayerPair = Action(i,:);
    AddPair = sum(PlayerPair);
    switch AddPair
        case 0                      % 0+0=0
            po1(i) = P; po2(i) = P;
        case 1                      % 1+0=0+1=1
            if PlayerPair(1) == 1
                po1(i) = S; po2(i) = T; 
            else
                po1(i) = T; po2(i) = S;
            end
        case 2                      % 1+1=2
            po1(i) = R; po2(i) = R;
        otherwise
            disp('false input')
    end
end
 po = [po1,po2];
 
 