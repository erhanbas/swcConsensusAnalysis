function swcComparison()
%%
addpath(genpath('../common'))
swcfold = './G-022/wrtoConsensus'
myfolds = dir(swcfold);
myfolds=myfolds(~ismember({myfolds.name},{'.','..'}));
myfolds = myfolds([myfolds.isdir]);
%%
[A_cons,subs_cons] = swc2G('./G-022/Round 5/FragMan_2017-09-25_G-022_Consensus.swc');
%%
tot_path_cons = G2totpathlength(max(A_cons,A_cons'),subs_cons);
base_stats_cons = [tot_path_cons full(getNumBr(A_cons))];
%%
type='Frag'
[base_stats_frag,unique_consensus_stat_frag,unique_annotator_stat_frag] = generateStat(myfolds,type);
%%
type='Man'
[base_stats_man,unique_consensus_stat_man,unique_annotator_stat_man] = generateStat(myfolds,type);
