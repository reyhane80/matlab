% فرض کنید 'text' متغیری است که حاوی متن کامل شما است
text = "World War II, also known as the Second World War, was a global war that lasted from 1939 to 1945. It involved the vast majority of the world’s nations including all of the great powers eventually forming two opposing military alliances: the Allies and the Axis. It was the most widespread war in history, and directly involved more than 100 million people from over 30 countries. The major participants threw their entire economic, industrial, and scientific capabilities behind the war effort, blurring the distinction between civilian and military resources. The war was marked by significant events that shaped modern history: The rise of fascism in Europe, with Nazi Germany under Adolf Hitler’s leadership, invading Poland in 1939, which led to Britain and France declaring war on Germany. The Holocaust, where six million Jews were systematically murdered, along with other groups such as Romani people, disabled individuals, and political dissidents. The use of atomic bombs by the United States on the Japanese cities of Hiroshima and Nagasaki in August 1945, which was a first in human history and contributed to the end of the war. World War II altered the political alignment and social structure of the world. The United Nations (UN) was established to foster international co-operation and prevent future conflicts. The great powers that were victorious in the war the United States, the Soviet Union, China, the United Kingdom, and France became the permanent members of the United Nations Security Council. The Soviet Union and the United States emerged as rival superpowers, setting the stage for the Cold War, which lasted for the next 46 years. Meanwhile, the influence of European great powers waned, leading to the decolonization of Asia and Africa. This is a very brief overview, and there’s much more to the story of World War II, including numerous battles, strategies, and personal stories of bravery and tragedy. If you’re interested in a specific aspect of the war, feel free to ask!";

% 'sentence' جمله‌ای است که می‌خواهید احتمال آن را بیابید
sentence = 'The Holocaust, where six million Jews were systematically murdered';

% تعداد دفعات ظهور جمله در متن 
occurrences = length(strfind(text, sentence));

% تعداد کل جملات در متن

total_sentences = length(strfind(text, '.'));

if total_sentences == 0
    error('تعداد جملات نمی‌تواند صفر باشد.');
end

% احتمال ظهور جمله 
probability = occurrences / total_sentences;

disp(['احتمال ظهور جمله: ', num2str(probability)]);
