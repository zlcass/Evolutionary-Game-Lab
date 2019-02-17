function Agent = mutant( Agent,Siz)
n = round(3/100*Siz^2);
a = zeros(Siz);
a(randperm(numel(a), n)) = randn(n,1);

%%%%%%%%% test code %%%%%%%%%%%
% I = randperm(numel(a), n);
% [i,j] = ind2sub([Siz,Siz],I);
% MuntPoint_ij = [i;j]'

%%%%%%%%% test code %%%%%%%%%%%

Agent = Agent + a; % maybe nicer, and maybe nastier. n out 10000 mutant.

end


