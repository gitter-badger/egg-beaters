% clear all;
close all;
L = 4;
% w = [1,1,1,1];
% w = [2,3,-1,-4];
fA = eye(2);
fb = [0;0];
x = [];
y = [];
lambda = 40;

for i=1:5
%     lambda(i) = 200*i;
%     beta = [floor(lambda(i)/10),floor(lambda(i)/10),floor(lambda(i)/10),floor(lambda(i)/10)];%,floor(lambda(i)/6),floor(lambda(i)/30)];
%     beta = [floor(lambda(i)/20),floor(lambda(i)/20), -floor(lambda(i)/20),-floor(lambda(i)/20)];
    beta = floor(lambda/20) * ones(1,2*i);
    w = ones(1,2*i);
%     mu = beta(1) * L / lambda(i)/w(1);
%     nu = beta(2) * L / lambda(i) / w(2);
%     mu1(i) = beta(1) * L / lambda(i);
%     nu1(i) = beta(2) * L / lambda(i);
%     mu2(i) = beta(3) * L / lambda(i);
%     nu2(i) = beta(3) * L / lambda(i);
    actions = [];
    indices = [];
%     for j=0:2:length(w) - 1
%         beta = [beta(end-1:end),beta(1:end-2)];
%         if (isempty(find(beta.*w < 0, 1)))
            fixedPoints = test(fA,fb,w,beta,lambda,L);
            [nActions,nIndices] = getActions(fixedPoints,w,beta,lambda,L);
            actions = [actions;nActions];
            indices = [indices,nIndices];
%         end
%     end
    w
%     if (lambda(i) == 80000)
%         disp(actions);
%     end
%     x = [x, fixedPoints(1,1)];
%     y = [y,fixedPoints(1,2)];
    gaps = getGap(actions,indices);
    constraint(i) = max(gaps(:,2));
end
plot(1:length(constraint),constraint)
% figure;
% plot(lambda,x)
% hold on;
% plot(lambda,y,'r');
% hold on;
% plot(lambda,mu1*10,'r');
% plot(lambda,nu1*10,'g');