function [FluDataset] = DatasetInitialise( AlgorithmTestingOn )

if(AlgorithmTestingOn == 'fludata')
%This File fetches dataset from the xlsx file 
%And converts it into a table.
SheetNumber = 1;
[CH,CV,ActualData] = xlsread('fluML.xlsx',SheetNumber);
rowHeadings = {'Student','Vaccin','HndWshQual','HndWshFreq','SocialDist','NotTchFace','RespEtiq','PrsnlDist','HandSanit','Risk','Complic','Barriers','Inefficacy','KnowlTrans','KnowlMgmt','Sick','Flu','Gender'};
Grad = cell2struct(ActualData, rowHeadings, 2);
Grad(1) = [];

FluDataset = struct2table(Grad);
FluDataset(any(isnan(FluDataset.Risk),2) == 1,:) = [];
FluDataset(any(isnan(FluDataset.KnowlTrans),2) == 1,:) = [];
FluDataset(any(isnan(FluDataset.RespEtiq),2) == 1,:) = [];
index0 = (find(FluDataset.RespEtiq== max(FluDataset.RespEtiq(:))));
FluDataset(index0,:) = [];
% index1 = find(FluDataset.Risk== max(FluDataset.Risk(:)))
% FluDataset(index1,:) = [];
clearvars -except FluDataset;
%Scaling::
% % FluDataset.Risk  = (((3*(FluDataset.Risk - min(FluDataset.Risk))/(max(FluDataset.Risk)-min(FluDataset.Risk))))- 1.5);
% FluDataset.KnowlTrans = (((2.9*(FluDataset.KnowlTrans - min(FluDataset.KnowlTrans))/(max(FluDataset.KnowlTrans)-min(FluDataset.KnowlTrans))))- 1.45);
% FluDataset.RespEtiq  = (((2.9*(FluDataset.RespEtiq - min(FluDataset.RespEtiq))/(max(FluDataset.RespEtiq)-min(FluDataset.RespEtiq))))- 1.45);
FluDataset.Risk  = ((((FluDataset.Risk - min(FluDataset.Risk))/(max(FluDataset.Risk)-min(FluDataset.Risk)))));
FluDataset.KnowlTrans = ((((FluDataset.KnowlTrans - min(FluDataset.KnowlTrans))/(max(FluDataset.KnowlTrans)-min(FluDataset.KnowlTrans)))));
FluDataset.RespEtiq  = ((((FluDataset.RespEtiq - min(FluDataset.RespEtiq))/(max(FluDataset.RespEtiq)-min(FluDataset.RespEtiq)))));
else
    
end    
end


