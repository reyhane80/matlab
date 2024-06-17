% خواندن تصویر
m = imread('Aks.jpg');

% نمایش اطلاعات تصویر
info = imfinfo('Aks.jpg');
disp(info);

% اعمال فیلتر Sobel
sobelFilter = fspecial('sobel');
sobelImage = imfilter(m, sobelFilter);

% اعمال فیلتر Gaussian
gaussianFilter = fspecial('gaussian');
gaussianImage = imfilter(m, gaussianFilter);

% اعمال فیلتر Prewitt
prewittFilter = fspecial('prewitt');
prewittImage = imfilter(m, prewittFilter);

% اعمال فیلتر Laplacian
laplacianFilter = fspecial('laplacian');
laplacianImage = imfilter(m, laplacianFilter);

% اعمال فیلتر LoG (Laplacian of Gaussian)
logFilter = fspecial('log');
logImage = imfilter(m, logFilter);

% اعمال فیلتر Average
averageFilter = fspecial('average');
averageImage = imfilter(m, averageFilter);

% اعمال فیلتر Unsharp
unsharpFilter = fspecial('unsharp');
unsharpImage = imfilter(m, unsharpFilter);

% نمایش تصاویر
figure, imshow(sobelImage), title('Sobel Filter');
figure, imshow(gaussianImage), title('Gaussian Filter');
figure, imshow(prewittImage), title('Prewitt Filter');
figure, imshow(laplacianImage), title('Laplacian Filter');
figure, imshow(logImage), title('LoG Filter');
figure, imshow(averageImage), title('Average Filter');
figure, imshow(unsharpImage), title('Unsharp Filter');