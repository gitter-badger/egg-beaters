function [px,py] = getEndPoint(startx,starty,word,lambda,inH,L)
if (isempty(word))
    px = startx;
    py = starty;
else
    x = startx;
    y = mod(starty + (1-abs(x)) * word(1)*lambda,L);
    if (y > L-1)
        y = y-L;
    end
    if (inH)
        [x,y] = transformHV(x,y,L);
    else
        [x,y] = transformVH(x,y,L);
    end
    [px,py] = getEndPoint(x,y,word(2:end),lambda,~inH);
end