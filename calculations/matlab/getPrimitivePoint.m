function [px,py] = getPrimitivePoint(endx,endy,word,lambda)
L = 4;
if (isempty(word))
    px = endx;
    py = endy;
else
    [nEx,nEy] = getPrimitivePoint(endx,endy,word(2:end),lambda);
    [nEx,nEy] = transformHV(nEx,nEy,L);
    px = nEx;
    py = mod(nEy + (-1)^(word(1)) * (1-abs(nEx)) * lambda,L);
end