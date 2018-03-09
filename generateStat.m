function [base_stats,unique_consensus_stat,unique_annotator_stat] = generateStat(myfolds,type)
[base_stats,unique_consensus_stat,unique_annotator_stat] = deal([]);
for ifold = 1:length(myfolds)
    %%
    sprintf('%d out of %d',ifold,length(myfolds))
    fold = myfolds(ifold);
    foldpath = fullfile(fold.folder,fold.name,type);

    basefile = dir(fullfile(foldpath,'*base.swc'));
    swcfile = fullfile(basefile.folder,basefile.name);
    [A,subs] = swc2G(swcfile);
%     graph = full(getNumBr(A));% numBranches, numJunctions, numTips
    tot_path = G2totpathlength(max(A,A'),subs);
    base_stats(ifold,:) = [tot_path full(getNumBr(A))];
    %%
    unfiles = dir(fullfile(foldpath,'*unique*.swc'));
    unconsfile = dir(fullfile(foldpath,'*FragMan*_unique*.swc'));
    unannfile = unfiles(find(~contains({unfiles.name},unconsfile.name)));
    %%
    swcfile = fullfile(unconsfile.folder,unconsfile.name);
    [A,subs] = swc2G(swcfile);
    tot_path = G2totpathlength(max(A,A'),subs);
    unique_consensus_stat(ifold,:) = [tot_path full(getNumBr(A))];
    %%
    swcfile = fullfile(unannfile.folder,unannfile.name);
    [A,subs] = swc2G(swcfile);
    tot_path = G2totpathlength(max(A,A'),subs);
    unique_annotator_stat(ifold,:) = [tot_path full(getNumBr(A))];
%     figure
%     
%     gplot3(A,subs)
%     hold on
%     myplot3(subs([4799:4800],:),{'Color','r','Linewidth',4})
    
end

