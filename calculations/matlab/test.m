function solutions = test(A,b,w,beta,lambda,L)
if (isempty(w) && isempty(beta))
    [x, y] = findFixPoint(A,b);
    solutions = [x,y];
elseif (isempty(w) && ~isempty(beta))
    solutions = [];
else
    fH1 = [1 0; -w(1)*lambda 1];
    fH2 = [1 0; w(1)*lambda 1];
    fV1 = [1 0; -w(2)*lambda 1];
    fV2 = [1 0; w(2)*lambda 1];
    HV = [0 -1; 1 0];
    VH = [0 1; -1 0];
    bH1 = [0; w(1)*lambda-beta(1) * L];
    bH2 = [0; w(1)*lambda-beta(1) * L];
    bV1 = [0; w(2)*lambda-beta(2) * L];
    bV2 = [0; w(2)*lambda-beta(2) * L];
    b11 = VH*(bV1+fV1*HV*bH1);
    b21 = VH*(bV2+fV2*HV*bH1);
    b12 = VH*(bV1+fV1*HV*bH2);
    b22 = VH*(bV2+fV2*HV*bH2);
    A11 = VH*fV1*HV*fH1;
    A12 = VH*fV1*HV*fH2;
    A21 = VH*fV2*HV*fH1;
    A22 = VH*fV2*HV*fH2;
%     
%     A11 = [1 -lambda; 0 1] * [1 0; -lambda 1]
%     A12 = [1 -lambda; 0 1] * [1 0; lambda 1];
%     A21 = [1 lambda; 0 1] * [1 0; -lambda 1]
%     A22 = [1 lambda; 0 1] * [1 0; lambda 1];
%     b11 = [-(1-L*beta(1)/ lambda) * lambda^2 + (1-L*beta(2) / lambda) * lambda; (1-L*beta(1)/lambda)*lambda]
%     b12 = [-(1-L*beta(1)/ lambda) * lambda^2 + (1-L*beta(2) / lambda) * lambda; (1-L*beta(1)/lambda)*lambda];
%     b21 = [(1-L*beta(1)/ lambda) * lambda^2 + (1-L*beta(2) / lambda) * lambda; (1-L*beta(1)/lambda)*lambda]
%     b22 = [(1-L*beta(1)/ lambda) * lambda^2 + (1-L*beta(2) / lambda) * lambda; (1-L*beta(1)/lambda)*lambda];
%     
    sols11 = test(A11*A, A11*b + b11, w(3:end),beta(3:end),lambda,L);
    sols12 = test(A12*A, A12*b + b12, w(3:end),beta(3:end),lambda,L);
    sols21 = test(A21*A, A21*b + b21, w(3:end),beta(3:end),lambda,L);
    sols22 = test(A22*A, A22*b + b22, w(3:end),beta(3:end),lambda,L);
    
    solutions = [sols11;sols12;sols21;sols22];
end