load('oil.mat');     %loading data

%normalizing traning data between -1 and 1
normtrn = rescale(trndata,-1,1);

%taking pca on normalized traning data
[pctrnVals, pctrnVecs] = pca(normtrn);

%getting PC 1 and 2 of traningdata in training data’s PCA space.
PCtrn1 = normtrn * pctrnVecs(:,1:2);

%normalizing testing data between -1 and 1
normtst = rescale(tstdata,-1,1);

%getting PC 1 and 2 of testingdata in training data’s PCA space.
PCtst1 = normtst * pctrnVecs(:,1:2);

f1 = figure(1);
hold on;

plot(PCtrn1(trnlabels==1,1),PCtrn1(trnlabels==1,2),'rx');
plot(PCtrn1(trnlabels==2,1),PCtrn1(trnlabels==2,2),'bx');
plot(PCtrn1(trnlabels==3,1),PCtrn1(trnlabels==3,2),'gx');

plot(PCtst1(tstlabels==1,1),PCtst1(tstlabels==1,2),'ro');
plot(PCtst1(tstlabels==2,1),PCtst1(tstlabels==2,2),'bo');
plot(PCtst1(tstlabels==3,1),PCtst1(tstlabels==3,2),'go');

legend('TrainingData 1', 'TrainingData 2', 'TrainingData 3', 'TestingData 1', 'TestingData 2', 'TestingData 3');

saveas(f1,'f31.png')