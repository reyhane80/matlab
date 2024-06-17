% تمرین 2-1 بخش اول

% گرفتن عدد صحیح n از کاربر
n = 10;

% ایجاد بردار 100 عنصری بین 0 و 2nπ
x = linspace(0, 2*n*pi, 100);

% محاسبه مقادیر y با استفاده از رابطه داده شده
y = abs(sin(x)) .* x.^2;
