image0 = imread('O.jfif');

% انتخاب یک سطر و ستون از تصویر
row = image0(300, :); % خط افقی در y=300
column = image0(:, 300); % خط عمودی در x=300

% محاسبه تبدیل فوریه
F1 = abs(fft(row));
F2 = abs(fft(column));

% یافتن فرکانس با شناسایی بیشینه در طیف تبدیل فوریه، به جز جزء DC
[~, freqIndexRow] = max(F1(2:end));
[~, freqIndexcolumn] = max(F2(2:end));


% اصلاح افست شاخص به دلیل حذف جزء DC
freqIndexRow = freqIndexRow + 1; 
freqIndexcolumn = freqIndexcolumn + 1;

% محاسبه ابعاد طرح (با در نظر گرفتن رزولوشن 600 dpi)
patternWidth = 600 / freqIndexRow;
patternHeight = 600 / freqIndexcolumn;

fprintf('عرض طرح: %.2f اینچ\n', patternWidth);
fprintf('ارتفاع طرح: %.2f اینچ\n', patternHeight);
