%loading TrainingSet
trainingSet = textscan((fopen('trainingSet.scale', 'r')), '%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%[^\n\r]', 'Delimiter', {' ',':'}, 'MultipleDelimsAsOne', true, 'TextType', 'string',  'ReturnOnError', false);
% r for read only
trainingSet = [trainingSet{1:end-1}];               %last column is white space and converting set into metrix 
trainingSet = trainingSet(:,1:2:end);               %geting index having data and labels
traindata = trainingSet(:,2:end);                   %Data is from 2nd column
trainlabel = trainingSet(:,1);                      %geting testinglabels

%loading TestingSet
testingSet = textscan((fopen('testingSet.scale', 'r')), '%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%[^\n\r]', 'Delimiter', {' ',':'}, 'MultipleDelimsAsOne', true, 'TextType', 'string',  'ReturnOnError', false);

testingSet = [testingSet{1:end-1}];       
testingSet = testingSet(:,1:2:end);               
testdata = testingSet(:,2:end);                 
testlabel = testingSet(:,1); 

predlabel = load('predicted.output');               %loading predicted lables
                      
mis_class_pat = sum(predlabel ~= testlabel);        %Getting total number of missclassifid patterns
error_rate = mis_class_pat / size(testlabel, 1);    %calculating error_rate
mis_pat_ind = find(predlabel ~= testlabel);         %Getting indexes of missclassifid patterns

%normalizing trainingSet data
mean = mean(traindata);
std = std(traindata);
norm = (traindata-mean)./(std);

%taking PCA
[pcVals, pcVecs] = pca(norm);

%getting PC 1 and 2
PC12 = testdata * pcVecs(:,1:2);

f1 = figure(1);
hold on;

%Plotting actual testing data
plot(PC12(testlabel==1,1),PC12(testlabel==1,2),'bo');
plot(PC12(testlabel==2,1),PC12(testlabel==2,2),'rx');
plot(PC12(testlabel==3,1),PC12(testlabel==3,2),'g+');
legend('Class 1', 'Class 2', 'Class 3')

saveas(f1,'f51.png');

f2 = figure(2);
hold on;

%Plotting predicted testing data
plot(PC12(predlabel==1,1),PC12(predlabel==1,2),'bo');
plot(PC12(predlabel==2,1),PC12(predlabel==2,2),'rx');
plot(PC12(predlabel==3,1),PC12(predlabel==3,2),'g+');

%ploting missclassified points on predicted testing data
plot(PC12(mis_pat_ind, 1), PC12(mis_pat_ind, 2), 'k.', 'LineWidth', 2, 'MarkerSize', 10);
legend('Class 1', 'Class 2', 'Class 3', 'Miss Classified Pattern')

saveas(f2,'f52.png');