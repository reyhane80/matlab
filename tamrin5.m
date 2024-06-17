image0 = imread('flower.tif');
image_gray = rgb2gray(image0);
image_binery = imbinarize(image_gray);
imshow(image_binery);

operations = {'erode', 'fill', 'hbreak', 'open', 'skel', 'remove', 'close', 'dilate'};
% اجرای هر عملیات و نمایش نتیجه
for i = 1:length(operations)
    % انجام عملیات مورفولوژیکی
    A = bwmorph(image_binery, operations{i}, Inf);
    
    % نمایش تصویر پس از عملیات
    subplot(2,4,i);
    imshow(A);
    title(operations{i});
end