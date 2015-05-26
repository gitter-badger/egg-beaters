function [gap]=getGap(actions,indices)
uqInds = sort(unique(indices),'descend');
gap = [];
for ind=uqInds(1):-1:uqInds(end-1)
    indActions = actions(indices == ind);
    lowerIndActions = actions(indices==ind-1);
    gap(end+1,:) = [ind,Inf];
    for i=1:length(indActions)
        for j=1:length(lowerIndActions)
            if (indActions(i) - lowerIndActions(j) < gap(end,2))
                gap(end,2) = indActions(i) - lowerIndActions(j);
            end
        end
    end
end