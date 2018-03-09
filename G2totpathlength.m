function tot_path = G2totpathlength(A,subs)
clear ed
[ed(:,1), ed(:,2)] = find(triu(A));
pd = squareform(pdist(subs));
acc=zeros(1,size(ed,1));
for ii=1:size(ed,1)
    acc(ii) = pd(ed(ii,1),ed(ii,2));
end
tot_path = sum(acc);