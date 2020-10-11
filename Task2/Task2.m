image = imread('img.tiff');    %loading image and converting to double

%Normalising image
normImage = im2double(image);

%taking PCA
[pcVals, pcVecs] = pca(normImage);
imshow(pcVecs);
PC10 = normImage * pcVecs(:,1:10);        %geting 1st 10 PC
ImagePC10 = PC10 * (pcVecs(:,1:10))';       %geting original domain of image
f1 = figure(1);
imshow(ImagePC10);
saveas(f1,'f21.jpg')

PC20 = normImage * pcVecs(:,1:20);        %geting 1st 20 PC
ImagePC20 = PC20 * (pcVecs(:,1:20))';       %geting original domain of image
f2 = figure(2);
imshow(ImagePC20);
saveas(f2,'f22.jpg')

PC50 = normImage * pcVecs(:,1:50);        %geting 1st 50 PC
ImagePC50 = PC50 * (pcVecs(:,1:50))';       %geting original domain of image
f3 = figure(3);
imshow(ImagePC50);
saveas(f3,'f23.jpg')