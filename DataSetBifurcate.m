function [DataBifuractedTrain,DataBifuractedTest] = DataSetBifurcate(dataset,Number)
TraingfluData = dataset(1:(Number),:);
TestfluData = dataset(Number+1:end,:);
DataBifuractedTrain = TraingfluData;
DataBifuractedTest = TestfluData;
end

