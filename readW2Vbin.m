function emb = readW2Vbin(fileName)
%% readW2Vbin2

% این تابع یک فایل مدل word2vec آموزش دیده شده باینری را می‌خواند.

% نحو: emb = readW2Vbin2(fileName)

% ورودی: fileName [string] مسیر به فایل مدل word2vec که باید خوانده شود
% خروجی: emb [wordEmbedding] یک شیء wordEmbedding

% توجه:
% کد فرض می‌کند که فایل ورودی با فرمت باینری word2vec سازگار است با
% فرمت استفاده شده در فایل "GoogleNews-vectors-negative300.bin.gz".


space  = uint8(' ');

fid = fopen(fileName,'r');
if fid < 0
  error('فایل پیدا نشد\n');
end

nHeader = 50;

tmpHead = fread(fid,nHeader,'*uint8');
idxSpc = find(tmpHead==space,  1,'first');
idxNewline  = find(tmpHead==newline,1,'first');

nWords = str2double(char(tmpHead(1:idxSpc-1))');
nDims  = str2double(char(tmpHead(idxSpc+1:idxNewline-1))');

% موقعیت فایل را به انتهای بخش هدر تنظیم کنید.
fseek(fid,idxNewline,'bof');

%% آماده‌سازی آرایه‌ها و برخی پارامترها

% آرایه‌ها را برای ذخیره واژگان (|voc|) و بردار (|mat|)
vocab = repmat("",       [nWords     1]);
mat   = repmat(single(0),[nWords nDims]);


% نمایش نوار پیشرفت
hw = waitbar(0,'در حال بارگذاری فایل word2vec');

%% خواندن بخش اصلی فایل

for i = 1:nWords
    % کلمه را بخوانید
    intData = fread(fid, nBuffer, '*uint8');
    idxNull = find(intData == 0, 1, 'first');
    vocab(i) = string(char(intData(1:idxNull-1))');

    % بردار را بخوانید
    mat(i,:) = fread(fid, nDims, 'single');

    % نوار پیشرفت را به‌روزرسانی کنید
    waitbar(i/nWords, hw);
end

% فایل را ببندید
fclose(fid);

% ایجاد شیء wordEmbedding
emb = wordEmbedding(vocab, mat);
end
