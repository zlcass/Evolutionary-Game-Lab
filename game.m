
function  Action = game(a1,a2,rd)
% rd = 10;
if a1>=0
    if a2>=0
        %disp('a1>=0; a2>=0;')
        Action = ones(rd,2);
    else
        %disp('a1>=0; a2<0;')
        Action = game_nina(a1,a2,rd);
    end
elseif a2>0
    %disp('a1<0; a2>0;')
    Act = game_nina(a2,a1,rd);
    Action(:,1) = Act(:,2);
    Action(:,2) = Act(:,1);
%     Action;
else
    %disp('a1<0; a2<0;')
    Action = game_nana(a1,a2,rd);
end
end

