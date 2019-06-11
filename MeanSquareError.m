function [Cost] = MeanSquareError(Theta,hypothesis,TrainingData)
[row,column] = size(TrainingData);
for i = 1:1:row
    x = TrainingData.KnowlTrans(i);
    y = TrainingData.Risk(i);
    z = TrainingData.RespEtiq(i);
if(hypothesis == 1)
    Cost(i) = (Theta(1) + Theta(2)*x - y)^2;
end
if(hypothesis == 2)
    Cost(i) = (Theta(1) + Theta(2)*x + Theta(3)*x^2 - y)^2;
end
if(hypothesis == 3)
    Cost(i) = (Theta(1) + Theta(2)*x + Theta(3)*z - y)^2;
end
end
end