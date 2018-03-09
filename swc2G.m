function [A,subs] = swc2G(swcfile)
    [swcData,offset,color, header] = loadSWC(swcfile);
    swcData(:,3:5) = swcData(:,3:5) + ones(size(swcData,1),1)*offset;
    ed = swcData(:,[1 7]);
    ed(any(ed==-1,2),:)=[];
    %%
    A = sparse(ed(:,1),ed(:,2),1,max(ed(:)),max(ed(:)));
    subs=swcData(:,3:5);
