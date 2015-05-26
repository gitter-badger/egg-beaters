function [actions,indices] = getActions(fixedPoints,word,beta,lambda,L)
actions = zeros(size(fixedPoints,1),1);
for i=1:size(fixedPoints,1)
    pts = getTrajectoryPoints(fixedPoints(i,1),fixedPoints(i,2),word,lambda,true,L);
    for j=1:size(pts,1)-1
        actions(i) = actions(i) + calcAction(pts(j,1),pts(j,2),lambda,word(j));
    end
%     actions(i) = actions(i)  pts(1,1)*pts(1,2);
    indices(i) = 0.5 * (length(find(sign(word)' .*pts(1:end-1,1) > 0)) - length(find(sign(word)'.*pts(1:end-1,1) < 0)));
    if (norm(pts(end,:) - fixedPoints(i,:)) > 0.01)
        disp('ERROR!!!');
        pts(end,:)
        fixedPoints(i,:)
    end
end
