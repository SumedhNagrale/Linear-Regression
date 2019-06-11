function [] = PlotFunction(Theta1,Theta2,Theta3,Cost,hypothesis,prefix)
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

f1 = figure;
plot(Theta1)
title({'\theta_0 vs iteration'});
xlabel('t');
ylabel('\theta_0')
f1.PaperUnits = 'inches';
f1.PaperPosition = [0 0 12 6];
%f1name = strcat('theta1.png');
f1name = strcat(filenameprefix,'theta1.png');
saveas(f1,[pwd f1name]);

f2 = figure;
plot(Theta2)
title({'\theta_1 vs iteration'});
xlabel('t');
ylabel('\theta_1')
f2.PaperUnits = 'inches';
f2.PaperPosition = [0 0 12 6];
f1name = strcat(filenameprefix,'theta2.png');
saveas(f2,[pwd f1name]);

f3 = figure;
plot(Theta3)
title({'\theta_2 vs iteration'});
xlabel('t');
ylabel('\theta_2')
f3.PaperUnits = 'inches';
f3.PaperPosition = [0 0 12 6];
f1name = strcat(filenameprefix,'theta3.png');
saveas(f3,[pwd f1name]);

f4 = figure;
plot(Cost)
title({'Cost vs iteration'});
xlabel('t');
ylabel('J_{min}')
f4.PaperUnits = 'inches';
f4.PaperPosition = [0 0 12 6];
f1name = strcat(filenameprefix,'Cost.png');
saveas(f4,[pwd f1name]);

end

