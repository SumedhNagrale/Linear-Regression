function [] = plotline( Theta1,Theta2,Theta3,TrainingData,hypothesis)
if(hypothesis == 1)
figure
scatter(TrainingData.KnowlTrans,TrainingData.Risk);
hold on;

[row,column] = size(TrainingData);
x = -1.5:0.5:1.5;
y = -1.5:0.5:1.5;
% x = 1:1:row;
% y = 1:1:row;
for k = 1:10
	plot(Theta1(k) + Theta2(k)*x,y)
	axis equal
	M(k) = getframe;
end
end

if(hypothesis == 2)
figure
scatter(TrainingData.KnowlTrans,TrainingData.Risk);
hold on;

[row,column] = size(TrainingData);
x  = -100:0.5:100;
y = -100:0.5:100;
for k = 1:10000
	plot(Theta1(k) + Theta2(k)*x + Theta3(k)*x.^2,y)
	axis equal
	M(k) = getframe;
end
end

if(hypothesis == 3)
figure
%B = (((3*(TrainingData.RespEtiq - min(TrainingData.RespEtiq))/(max(TrainingData.RespEtiq)-min(TrainingData.RespEtiq))))- 1.5);
scatter3(TrainingData.KnowlTrans,TrainingData.Risk,TrainingData.RespEtiq);
hold on;
[row,column] = size(TrainingData);
[X,Y] = meshgrid(-5:0.1:5,-5:0.1:5);
% x = 1:1:row;
% y = 1:1:row;
%Z = (-Theta1(k) - Theta2(k)*X)/Theta3(k);
Z = (-Theta1- Theta2*X)/Theta3;
surf(X,Y,Z) 
%axis equal
%M(k) = getframe;

end
%plot(Theta1 + Theta2*x,y)

end

