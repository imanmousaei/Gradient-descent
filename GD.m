clc
clear 
close all
%%
w1=0;
w2=0;
u=0.1;
p=[0.100 0.200 0.500];
d=[0.1000 0.0500 0.0015];

figure(1)
plot(p,d,'ro')
hold on
for i=1:700
    G1= 2 * p(1) * (d(1) - (p(1)*w1 + w2)) + 2 * p(2) * (d(2) - (p(2)*w1 + w2)) ...
        + 2 * p(3) * (d(3) - (p(3)*w1 + w2));
    
    G2= 2  * (d(1) - (p(1)*w1 + w2)) + 2  * (d(2) - (p(2)*w1 + w2)) ...
        + 2 * (d(3) - (p(3)*w1 + w2));
    w1=w1 + u * G1/3;
    w2=w2 + u * G2/3;
    
    E= 1/3*sum((d - (w1*p + w2)).^2);
%     figure(2)
%     plot(i,E,'k.')
%     hold on
%     pause(0.000001)
end
figure(1)
line([0,-w2/w1],[w2 , 0])