function [] = PlotTrain( Theta1,Theta2,Theta3,TrainingData,hypothesis,prefix)
if(hypothesis == 1)
    filenameprefix = '/Plots1/hypothesis1';
    filenameprefix = strcat(filenameprefix,prefix);
    f1 = figure
    scatter(TrainingData.KnowlTrans,TrainingData.Risk);
    hold on;
    [row,column] = size(TrainingData);
    x = 0:0.5:1;
    y = 0:0.5:1;
    plot(x,Theta1 + Theta2*x)
    title({'KnowlTrans vs Risk'});
    xlabel('KnowlTrans');
    ylabel('Risk')
    f1.PaperUnits = 'inches';
    f1.PaperPosition = [0 0 12 6];
    f1name = strcat(filenameprefix,'fitting.png');
    saveas(f1,[pwd f1name]);
    
%     figure
%     [X,Y] = meshgrid(-1.45:0.1:1.45,-1.45:0.1:1.45);
%     Z = Theta1 + Theta2*X - Y;
%     surf(X,Y,Z) 
end

if(hypothesis == 2)
    filenameprefix = '/Plots2/hypothesis2';
    filenameprefix = strcat(filenameprefix,prefix);
    f1 = figure;
    scatter(TrainingData.KnowlTrans,TrainingData.Risk);
    hold on;
    [row,column] = size(TrainingData);
    x  = 0:0.5:1;
    y = 0:0.5:1;
    plot(x,Theta1 + Theta2*x + Theta3*x.^2)
    title({'KnowlTrans vs Risk'});
    xlabel('KnowlTrans');
    ylabel('Risk')
    f1.PaperUnits = 'inches';
    f1.PaperPosition = [0 0 12 6];
    f1name = strcat('fitting.png');
    f1name = strcat(filenameprefix,'fitting2D.png');
    saveas(f1,[pwd f1name]);
    
    f3 = figure;
    scatter3(TrainingData.KnowlTrans,(TrainingData.KnowlTrans).^2,TrainingData.Risk);
    hold on;
    [X,Y] = meshgrid(0:0.1:1,0:0.1:1);
    Z = Theta1 + Theta2*X + Theta3*X.^2;
    surf(X,Y,Z) 
    title({' KnowlTrans,KnowlTrans^2 vs Risk'});
    xlabel('KnowlTrans');
    ylabel('KnowlTrans^2')
    zlabel('Risk')
    f3.PaperUnits = 'inches';
    f3.PaperPosition = [0 0 12 6];
    f1name = strcat(filenameprefix,'fitting3D.png');
    saveas(f3,[pwd f1name]);
end

if(hypothesis == 3)
    filenameprefix = '/Plots3/hypothesis3';
    filenameprefix = strcat(filenameprefix,prefix);
    [row,column] = size(TrainingData);
    [X,Y] = meshgrid(0:0.1:1,0:0.1:1);
    f3 = figure;
    scatter3(TrainingData.KnowlTrans,TrainingData.RespEtiq,TrainingData.Risk);
    hold on;
    Z = Theta3*Y + Theta1 + Theta2*X;
    %Z = (-Theta1-Theta2*X+Y)/Theta3;
    surf(X,Y,Z) 
    title({' KnowlTrans,RespEtiq vs Risk'});
    xlabel('KnowlTrans');
    ylabel('RespEtiq')
    zlabel('Risk')
    f3.PaperUnits = 'inches';
    f3.PaperPosition = [0 0 12 6];
    f1name = strcat(filenameprefix,'fitting.png');
    saveas(f3,[pwd f1name]);
end

end

