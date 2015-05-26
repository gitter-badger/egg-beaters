function points = getTrajectoryPoints(startx,starty,word,lambda,inH,L)
points = [startx,starty];
if (~isempty(word))
    x = startx;
    y = mod(starty + word(1)* (1-abs(x)) * lambda,L);
    if (y > L-1)
        y = y - L;
    end
    if (inH)
        [x,y] = transformHV(x,y,L);
    else
        [x,y] = transformVH(x,y,L);
    end
    newpts = getTrajectoryPoints(x,y,word(2:end),lambda,~inH,L);
    points(end+1:end+size(newpts,1),:) = newpts;

end
