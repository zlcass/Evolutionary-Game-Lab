function [ALLAgent, ALLAve, FreqF] = EoFN(Siz, rd, N_Ind, g)

Agent = randn(Siz)+(N_Ind*rd)*ones(Siz);%N_Ind belongs to [-1.+1]
Agent(Agent > rd) = rd;
Agent(Agent < -rd) = -rd;
%Agent = zeros(Siz);
% Agent = randn(Siz)
%Agent = -2*ones(Siz);
%Agent(Siz/2-1:Siz/2+2,Siz/2-1:Siz/2+2) = ones(4);% 4 clustered all
%forgiving agents in the center of this network

ALLAgent = zeros(Siz,Siz,g);
ALLAgent(:,:,1) = Agent;
ALLAve = zeros(g,1);
ALLAve(1) = mean(mean(Agent)); 
FreqF = zeros(g,1);
FreqF(1) = sum(sum(Agent>0))/(Siz^2);

%%
for i = 2:g 
    Agent = mutant(Agent,Siz);
    Payoff = Payoff_matrix(Agent,Siz,rd);
    Agent = DieOut(Payoff,Agent,Siz);
    Agent = SpreadOut(Payoff,Agent,Siz,rd);
    Generation = i   
    Ave = mean(mean(Agent))
    ALLAve(i) = Ave;
    ALLAgent(:,:,i)=Agent;
    FreqF(i) = sum(sum(Agent>0))/(Siz^2);
end

% %%
% figure
% bwr = @(n)interp1([1 2 3], [0.6350, 0.0780, 0.1840; 1 1 1; 0, 0.4470, 0.7410], linspace(1, 3, n), 'linear');
% for k = 1:g
%     %subplot(m,n,k);
%     colormap(bwr(100));
%     clims = [-rd +rd];
%     imagesc(ALLAgent(:,:,k),clims);
%     colorbar;
%     %drawnow
%     M(k) = getframe;
% end
% %%
% figure
% plot(ALLAve)
% grid on
% axis([1 g -3 12])
% title('Average of All Agents')
% xlabel('Generation')
% ylabel('Average')
% %% 
% 
% figure
% plot(FreqF)
% grid on
% axis([1 g 0 1])
% title('Freqency of Forgiving Ones')
% xlabel('Generation')
% ylabel('Frequency')


end