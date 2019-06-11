function [ r2 ] = R2(Theta,hypothesis,TestData )
[row,column] = size(TestData);
for i = 1:1:row
    x = TestData.KnowlTrans(i);
    y = TestData.Risk(i);
    z = TestData.RespEtiq(i);
if(hypothesis == 1)
    r(i) = (Theta(1) + Theta(2)*x - y)^2;
end
if(hypothesis == 2)
    r(i) = (Theta(1) + Theta(2)*x + Theta(3)*x^2 - y)^2;
end
if(hypothesis == 3)
    r(i) = (Theta(1) + Theta(2)*x + Theta(3)*z - y)^2;
end
end
a = sum(r);
b= sum((-TestData.Risk + mean(TestData.Risk)).^2);
r2 = 1- (a/b)
end

