function stats = getNumBr(A)
%%
A_=A;
junctions = sum(A_,1)>1;
tips = sum(A_,1)==0;
A_(:,junctions)=0;
[S,C]=graphconncomp(A_,'DIRECTED',false);
stats = [S,sum(junctions),sum(tips)];
% sum(junctions)
% S-sum(junctions)
