% الف) تصویر را خوانده و داده های آن را در متغیر بریزید 
image = imread('flower.tif');

% ریخته info  اطلاعات تصویر را در متغیر
info = imfinfo('flower.tif');

image1 = rgb2gray(image);
imshow(image1);
figure;

%% 

% ب) ريخن اعداد ماتريس هر رنگ قرمز سبز آبی در متغیر مخصوص خود
red_channel = image(:,:,1);    
green_channel = image(:,:,2);
blue_channel = image(:,:,3);

% ب) ریختن قسمت قرمز(خود) گل در یک متغیر و قسمت سبز در یک متغیر دیگر

b1 = (red_channel > 100) & (green_channel <152) & (blue_channel < 200) ; 
b2 = (red_channel < 40) & (green_channel > 10) & (blue_channel < 200) ;

% نمایش تصاویر b1 و b2 

subplot(2,3,1);
imshow(b1);
title('تصویر باینری b1 (قرمز)');
subplot(2,3,2);
imshow(b2);
title('تصویر باینری b2 (سبز)');
%%
% ج) استخراج مرز گل
b11 = edge(b1, 'Canny');
subplot(2,3,3);
imshow(b11);
title('مرز قسمت قرمز گل تصویر متغیر b1 ');
b22 = edge(b2 , 'Canny');
subplot(2,3,4);
imshow(b22);
title('مرز قسمت سبز گل تصویر متغیر b2 ');
%%
m0 = edge(image1, 'Canny');
subplot(2,3,5);
imshow(m0);
title('مرز همه گل در تصویر متغیر ');
m1 = green_channel > 120;
m2 = edge(m1 , 'Canny');
%% 
% تلفیق عکس های (b1 و b2) (د
c = b1 | b2;
subplot(2,3,6);
imshow(c);
title('عکس تلفیق شده b1 و b2');
%% 
% ه)محاسبه محیط و مساحت ها
masahatred = sum(b1(:));
masahatgreen = sum(b2(:));
mohitflower = sum(b11(:));


%% 
% ه) مختصات نخستین پیکسل سفید
[a1, a2] = find(b1, 1);
[a3, a4] = find(b2, 1);
disp([a1 , a2, a3, a4]);
%% 
% ز) استفاده از دستور تکست و نتایج قسمتهای "ه" و "و" پس از نمایش تصویر مساحت و محیط هر جز را در کنار آن نمایش دهد
figure;
imshow(image);
hold on;
text(270,432, sprintf('مساحت ساقه و برگ: %d', masahatgreen), 'Color', 'g');
text(554, 282, sprintf('مساحت قرمزی گل: %d', masahatred), 'Color', 'r');
text(100, 100, sprintf('محیط همه گل: %d', mohitflower), 'Color', 'b');
hold off;