% nice vs nasty game, where a1>0 and a2<0

function Action = game_nana(a1,a2,rd)
% Agent a1 a2 to probility P1 P2
P1 = -a1;
P2 = -a2;
P2p = P2/rd; %the possiblity of nasty of a2
P1p = P1/rd; %the possiblity of nasty of a1
w1 = 1- P1p;
w2 = 1- P2p;
% the following is the case of a1<0 and a2<0 
%%%%% set the first round of Action. %%%%%
Action = ones(rd,2);

r1 = rand;
if r1 < P1p
    Action(1,1) = 0;
    P1p = 1-(1-P1p)*w1;

end

r2 = rand;
if r2 < P2p
    Action(1,2) = 0;
    P2p = 1-(1-P2p)*w2;
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for i = 2:rd    
    r1 = rand;
    if Action(i-1,2) == 0
        Action(i,1) = 0;
        elseif r1 < P1p % in this case Action(i-1,2) = 1
            Action(i,1) = 0; %play nasty
            P1p = 1-(1-P1p)*w1;
        else
            Action(i,1) = 1; %not play nasty
    end


    r2 = rand;
    if Action(i-1,1) == 0
        Action(i,2) = 0;
    elseif r2 < P2p % in this case Action(i-1,1) = 1
        Action(i,2) = 0; %play nasty
        P2p = 1-(1-P2p)*w2;
    else
        Action(i,2) = 1;% not play nasty
    end
    
%     if P2 >1
%         P2 = P2 - 1;
%     end
end
end