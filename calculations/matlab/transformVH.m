function [nx,ny] = transformVH(x,y,L)
% if (inA(x,y))
    nx = y;
    ny = -x;
% elseif (inB(x,y,L))
%     nx = -(y-L/2);
%     ny = L/2 + x;
% else
%     nx = x;
%     ny = y;
% end