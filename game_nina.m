
%%%%%%%%%%%%%%%%%%%%%%%%%%exp forgiving %%%% exp nasty%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
% function Action = game_nina(a1,a2,rd)
% 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% P2 = -a2; 
% P1p = a1/rd; %the possiblity of nasty of a1
% P2p = P2/rd; %the possiblity of nasty of a2
% w1 = P1p;
% w2 = 1- P2p;
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Action = ones(rd,2);
% r2 = rand;
% if r2 < P2p
%     Action(1,2) = 0;
%     P2p = 1-(1-P2p)*w2;
% end
% %%%%%%%%count down forgiving%%%%%%%%
% for i = 2:rd    
%     r1 = rand;
%     if Action(i-1,2) == 1
%         Action(i,1) = 1;
%         elseif r1 < P1p %  Action(i,2) = 0, decided to forgive or not
%             Action(i,1) = 1; % play forgiveness
%             P1p = P1p*w1;
%         else
%             Action(i,1) = 0; %not play forgiveness
%     end
% 
%     r2 = rand;
%     if Action(i-1,1) == 0
%         Action(i,2) = 0;
%     elseif r2 < P2p % in this case Action(i-1,1) = 1
%         Action(i,2) = 0; % play nasty
%         P2p = 1-(1-P2p)*w2;
%     else
%         Action(i,2) = 1;% not play nasty
%     end
%     
% end
% 
% end


%%%%%%%%%%%%%%%%%%%%%%%%step forgiving%%%% exp nasty%%%%%%%%%%%%%%%%%%%%%%%
function Action = game_nina(a1,a2,rd)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
P2 = -a2; 
P1p = a1;
P2p = P2/rd; %the possiblity of nasty of a2
w2 = 1- P2p;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Action = ones(rd,2);
r2 = rand;
if r2 < P2p
    Action(1,2) = 0;
    P2p = 1-(1-P2p)*w2;
end
%%%%%%%%count down forgiving%%%%%%%%
for i = 2:rd    
    r1 = rand;
    if Action(i-1,2) == 1
        Action(i,1) = 1;
        elseif r1 < P1p %  Action(i,2) = 0, decided to forgive or not
            Action(i,1) = 1; % play forgiveness
            P1p = P1p-1;
        else
            Action(i,1) = 0; %not play forgiveness
            P1p = a1; %retaliate once and then gorgiving reset
    end
    
    r2 = rand;
    if Action(i-1,1) == 0
        Action(i,2) = 0;
    elseif r2 < P2p % in this case Action(i-1,1) = 1
        Action(i,2) = 0; % play nasty
        P2p = 1-(1-P2p)*w2;
    else
        Action(i,2) = 1;% not play nasty
    end
    
end
end