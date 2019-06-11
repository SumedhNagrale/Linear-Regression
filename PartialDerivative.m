function [dj1,dj2,dj3] = PartialDerivative(Theta,TrainingData,hypothesis)
[row,column] = size(TrainingData);
if(hypothesis == 1)
for i = 1:1:row
        xi = TrainingData.KnowlTrans(i);
        yi = TrainingData.Risk(i);
        dj1(i) = (Theta(1) + Theta(2)*xi - yi);
        dj2(i) = (Theta(1) + Theta(2)*xi  - yi)* xi; 
        dj3(i) =0;
end
end
if(hypothesis == 2)
    for i = 1:1:row
        xi = TrainingData.KnowlTrans(i);
        yi = TrainingData.Risk(i);
        dj1(i) = (Theta(1) + Theta(2)*xi + Theta(3)*xi^2- yi);
        dj2(i) = (Theta(1) + Theta(2)*xi + Theta(3)*xi^2- yi)* xi;   
        dj3(i) = (Theta(1) + Theta(2)*xi + Theta(3)*xi^2- yi)* xi^2;   
        
    end
end

if(hypothesis == 3)
    for i = 1:1:row
        xi = TrainingData.KnowlTrans(i);
        yi = TrainingData.Risk(i);
        zi = TrainingData.RespEtiq(i);
        dj1(i) = (Theta(1) + Theta(2)*xi + Theta(3)*zi - yi);
        dj2(i) = (Theta(1) + Theta(2)*xi  + Theta(3)*zi - yi)* xi;   
        dj3(i) = (Theta(1) + Theta(2)*xi  + Theta(3)*zi - yi)* zi;  
    end
end

end
