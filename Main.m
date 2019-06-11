function [] = Main()

for h = 3:1:3
hypothesis = h;
for dt = 4:1:4
    %30 Training Data%
    if(dt == 1)
    prefix = '40';
    SeperationRatio = 164;
    end
    %50 Training Data%
    if(dt == 2)
        prefix = '50';
    SeperationRatio = 204;
    end
    %70 Training Data%
    if(dt == 3)
        prefix = '70';
    SeperationRatio = 286;
    end
    if(dt == 4)
        prefix = 'Result';
     %90 Training Data%
    SeperationRatio = 367;
    end
%Initialise
[Theta,LearningRate,Epsilon,Iteration]=Initialise(hypothesis);
%FetchDataSet
fluDataSet = DatasetInitialise('fludata');
%Create DataSet for Training and Test
[TrainingData,TestData] = DataSetBifurcate(fluDataSet,SeperationRatio);
for i = 1:1:Iteration 
        [row,column] = size(TrainingData);
        N = row;
        [dj1,dj2,dj3] = PartialDerivative(Theta,TrainingData,hypothesis);
        Theta(1) = Theta(1) - LearningRate*(1/N)*sum(dj1);
        Theta(2) = Theta(2) - LearningRate*(1/N)*sum(dj2);
        Theta(3) = Theta(3) - LearningRate*(1/N)*sum(dj3);
        theta1(i) = Theta(1);
        theta2(i) = Theta(2);
        theta3(i) = Theta(3);
        Cost(i) = (1/(2*N))* sum(MeanSquareError(Theta,hypothesis,TrainingData));
end
%plots
PlotFunction(theta1,theta2,theta3,Cost,hypothesis,prefix);
ind =find(Cost == min(Cost(:)))
t1 = theta1(ind(1));
t2 = theta2(ind(1));
t3 = theta3(ind(1));
PlotTrain(t1,t2,t3,TrainingData,hypothesis,prefix);
%Testing
T = [t1;t2;t3];
if(hypothesis == 1)
    
    filenameprefix = '/Plots1/hypothesis1';
    filenameprefix = strcat(filenameprefix,prefix);
end
if(hypothesis == 2)
    filenameprefix = '/Plots2/hypothesis2';
    filenameprefix = strcat(filenameprefix,prefix);
end
if(hypothesis == 3)
    filenameprefix = '/Plots3/hypothesis3';
    filenameprefix = strcat(filenameprefix,prefix);
end
[row,col] = size(TestData);
MSE = (1/N)*(MeanSquareError(T,hypothesis,TestData));
r2 = (R2(T,hypothesis,TestData));

f3 = figure
plot(MSE); 
xlabel('t');
ylabel('Error^2')
f3.PaperUnits = 'inches';
f3.PaperPosition = [0 0 12 6];
f3name = strcat(filenameprefix,'error.png');
saveas(f3,[pwd f3name]);

CostTest = sum(MSE);
CostTrain(dt) = Cost(ind(1));
thetaTrain1(dt) = t1;
thetaTrain2(dt) = t2;
thetaTrain3(dt) = t3;
TestDataCost(dt) =CostTest;
ErrorTestdata(dt) = max(MSE);
ind1(dt) = ind(1);

display(CostTrain)
display(ind1)
display(thetaTrain1)
display(thetaTrain2)
display(thetaTrain3)

display(TestDataCost)
display(ErrorTestdata)
close all


end

end