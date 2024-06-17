% تمرین 2-1 بخش دوم 

% گرفتن عدد صحیح n از کاربر
n = 10;

% گرفتن عددی بین 0 و 1 از کاربر و قرار دادن آن در متغیر d
d = 0.5;

% ایجاد بردار x با گام‌های d بین 0 و 2nπ
x = 0:d:2*n*pi;

% محاسبه مقادیر y با استفاده از رابطه داده شده
y = abs(sin(x)) .* x.^2;
