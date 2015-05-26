% clear all;
close all;
L = 4;
% w = [1,1];
% w = [1,1,1,1];
w = [2,3,-4,-3];
fA = eye(2);
fb = [0;0];
x = [];
y = [];
N = min(abs(w));
for i=1:1
    lambda(i) = 1000*i;
%     beta = floor(lambda(i)/10)*ones(1,2);
%     beta = [floor(lambda(i)/10),floor(lambda(i)/10),floor(lambda(i)/10),floor(lambda(i)/10)];%,floor(lambda(i)/6),floor(lambda(i)/30)];
    beta = floor(lambda(i)/(20))*N;
% beta = [floor(lambda(i)/20),floor(lambda(i)/20), -floor(lambda(i)/20),-floor(lambda(i)/20)];
    mu(i) = beta(1) * L / (N*lambda(i));
%     mu1(i) = beta(1) * L / lambda(i);
%     nu1(i) = beta(2) * L / lambda(i);
%     mu2(i) = beta(3) * L / lambda(i);
%     nu2(i) = beta(3) * L / lambda(i);
    actions = [];
    indices = [];
    for j=0:2:length(w) - 1
        beta = [beta(end-1:end),beta(1:end-2)];
        if (isempty(find(beta.*w < 0, 1)))
            fixedPoints = test(fA,fb,w,beta,lambda(i),L);
            [nActions,nIndices] = getActions(fixedPoints,w,beta,lambda(i),L);
            actions = [actions;nActions];
            indices = [indices,nIndices];
        end
    end
    lambda(i)
    if (lambda(i) == 80000)
        disp(actions);
    end
%     x = [x, fixedPoints(1,1)];
%     y = [y,fixedPoints(1,2)];
    gap(:,:,i) = getGap(actions,indices);
end
for i=1:size(gap,3)
    constraint(i) = max(gap(:,2,i));
end
% plot(lambda,constraint)
% figure;
% plot(lambda,x)
% hold on;
% plot(lambda,y,'r');
% hold on;
% plot(lambda,mu1*10,'r');
% plot(lambda,nu1*10,'g');