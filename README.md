# RU_VIM_CHEATSHEET

> Пролог: данная шпаргалка была написана в течение прочтения автором книги по Vi-подобным редакторам. Советую использовать её как памятка после прочтения книги. В репозитории содержится pdf версия шпаргалки для желающих распечатать её. По всем улучшениям прошу писать в Discussions.

> В тексте используются обозначения:  
> {...} - расшифровывает мнемонику команды  
> [...] - аргументы команды  
> (...) - значения по-умолчанию или пояснения к командам  
> ~ - оператор эквивалентности команд, если явно не указано, что это и есть сама команда  

## Редактирование

### Базовые команды
```
i {insert} - вставка текста на позицию курсора
I - вставка в начале строки
a {append} - вставка текста после курсора
A - вставка текста в конце строки
o - вставка на следующей строке
O - вставка текста на предыдущей строке
c[command] {change} - замена текста, используя [command]
cc - замена строки
C - то же самое, что и команда c$
d[command] {delete} - удаление текста, используя [command]
dd - удаление строки
D - то же самое, что и команда d$
x {x-out/аналогия с телетайпом} - удаление следующего символа
X - удаление предыдущего символа
y {yank/выдернуть} - копирование текста
yy - копирование строки
Y - то же самое, что и команда yy
p {paste} - вставка после курсора
P - вставка перед курсором
. - повтор последней команды
u {undo} - отмена последней команды
U - отмена всех правок, которые происходили в строке, пока курсор на ней находился
CTRL+r {redo} - отмена отмены
s {substitute} - удаляет символ на позиции курсора и ожидает новый на замену
S - удаляет строку и подставляет текст
[num]r {replace} - замена [num] следующих символов на введенный символ ([num] = 1)
R - заменяет существующие символы без указания их количества до нажатия ESC
J {join} - объединение двух строк
~ {~ operator} - смена регистра символа
% - поиск и перемещение на ближайшую закрытую/открытую скобку (такие как (), [], {} или <>)
```

## Перемещение

### Базовое перемещение
```
[num]h - налево на [num] символов ([num] = 1)
[num]j - вниз на [num] символов ([num] = 1)
[num]k - наверх на [num] символов ([num] = 1)
[num]l - налево на [num] символов ([num] = 1)
```

### Перемещение экрана (scrolling)
```
CTRL+b {back} - пролистать на экран вверх
CTRL+u {up} - пролистать на полэкрана вверх
CTRL+y - пролистать на строку вверх
CTRL+e - пролистать на строку вниз
CTRL+d - пролистать на полэкрана вниз
CTRL+f - пролистать на экран вниз
z+- - пролистать экран наверх относитльно курсора
z+. - выровнить экран по центру относительно курсора
z+ENTER - пролистать экран вниз относительно курсора
```

### Перемещение курсора по строке
```
0 - переход на первый символ строки
^ {hat} - переход на первый непустой символ строки
$ - переход на последний непустой символ строки
b {begin} - перейти назад в начало слова с учетом знаков препинания
B - перейти назад в начало cлова без учета знаков препинания
w - перейти вперед на начало слова с учетом знаков препинания
W - перейти вперед на начало слова без учета знаков препинания
e {end} - перейти в конец слова с учетом знаков препинания
E - перейти в конец слова без учета знаков препинания
[num]| - переход на [num] столбец текущей строки ([num] = 1)
```

### Поиск символа в текущей строке
```
f[sym] {find} - переход в строке вперед на символ [sym]
F[sym] - переход в строке назад на символ [sym]
t[sym] - переход в строке вперед перед символом [sym]
T[sym] - переход в строке назад после символа [sym]
; - повтор поиска в том же направлении, что и последняя команда
, - повтор поиска в противоположном направлении, что и команда
```

### Глобальное перемещение курсора
```
[num]H {High} - переход в начало экрана на [num] строк ниже самой верхней строки без пролистывания ([num] = 0)
M {Middle} - переход в середину экрана без пролистывания
[num]L {Low} - переход в конец экрана на [num] строк вверх самой нижней строки без пролистывания ([num] = 0)
[num]gg {go go} - переход на [num] строку вниз относительно первой строки ([num] = 0)
[num]G {go to} - переход на [num] строку вверх относительно последней строки ([num] = last line)
- - переход на начало предыдущей строки
+ - переход на начало следующей строки
CTRL+g - вывод текущего положения в файле
```

### Общий вид команд с их повторениями
```
[num][cmd][text object]/[cmd][num][text object], где:
[num] - необязательный числовой аргумент,
[cmd] - команда редактирования (например, c, d или y),
[text object] - команда перемещения

Пример команд:
cH или dH или yH
cG или dG или yG
c13G или d13G или y13G
```

## Работа с файлами

### Поиск по файлу
```
/[pattern] - поиск [pattern] вперед
?[pattern] - поиск [pattern] назад
n {next} - поиск в том же направлении, что и команда
N - поиск в отличном направлении, что и команда
```

### Открытие файла
```
vi +[num] [file] - открытие файла на [num] строке
vi + [file] -  открытие файла на последней строке
vi +[/pattern] [file] - открыти файла на совпавшем [/pattern]
view/vi -R - открытие файла в read only режиме
vi -r - список всех файлов, сохраненных системой в текущей директории (*.sw* формат)
vi -r [file] - восстановление файла из буфера с помощью файла подкачки
```

### Сохранение и выход
```
ZZ - сохранение и выход
```

## Работа с буфферами

### Текстовые буфферы
```
"[(1-9)/(a-z)][P/p] - вставка из буффера, где [1-9] - последние изменения, а [a-z] - сохраненные в буфер изменения
"[a-Z][num][command] - если [a-z], то буфер перезаписывается, а [A-Z] - в буфер добавляются символы
"[*][command] - работа с PRIMARY CLIPBOARD (copy-on-select) регистром
"[+][command] - работа с CLIPBOARD (CTRL+C/CTRL+V) регистром

Примечание:
Последние 2 команды полезны при вставке текста из буфера обмена ОС.
```

### Оконные буфферы
```
:ls[!] или files[!] или buffers[!] - вывод списка буфферов (! дает более подробную информацию)
:edit [buffer] - редактирование буфера [buffer]
:windo [cmd] - применение к видимым окнам текущей вкладки команду [cmd]
:bufdo [!][cmd] {buffer do} - применение ко всем окнам текущей вкладки команду [cmd]
:ball или sball {buffer all} - редактировать все файлы в списке аргументов Vim
:unhide или sunhide - редактировать все загруженные буферы 
:badd [file] {buffer add} - добавляет файл [file] в список буферов
:bunload[!] {buffer unload} - выгружает буфер из памяти (! без изменений)
:bdelete[!] {buffer delete} - выгружает буфер и удаляет его из списка буферов (! без сохранений)
:buffer [n] или sbuffer [num] {buffer} - переход в буфер [n] ([n] = 1)
:bnext [n] или sbnext [n] {buffer next} - переход в следующий по порядку [n] буфер ([n] = 1)
:bNext [n] или sbNext [n] {buffer next} - переход в [n] предыдущий буфер ([n] = 1)
:bfirst или sbfirst {buffer first} - переход к первому буферу
:blast или sblast {buffer last} - переход к последнему буферу
:bmod [n] или sbmod [n] {buffer modified}- переход к [n] измененному буферу ([n] = 1)

Примечание:
Команды, начинающиеся на s* (приставка {split}), открывают новые окна.
Если добавить :vertical перед переходом с разделением в новый буффер, то окно будет разделено вертикально.
```

### Основные флаги буфферов
```
u - неотоброжаемый буфер (увидеть можно через !)
% - буфер текущего окна
# - буфер, в который можно переключиться
a - активный буфер
h - скрытый буфер
[-] - откл. опция modifiable (read only)
= - буфер нельзя сделать редактируемым
+ - буфер изменен
x - буфер содержит ошибки чтения
```

### Специальные буфферы
```
quickfix - буфер, содержащий список ошибок при компиляции
help - файлы справки Vim
directory - список файлов в каталоге
scratch - текст для общих целей
```

## Вкладки

### Базовые команды
```
:tabnew [file] - открывает новую вкладку
:tabclose - закрывает текущую вкладку
:tabonly - закрывает все остальные вкладки
:tabnext или [CTRL + PAGE DOWN] - переход на следующую вкладку
:tabprevious или [CTRL + PAGE UP] - переход на предыдущую вкладку
```

## Автозавершение

### Базовые команды
```
CTRL-X + [type autocompletion] - стандартный шаблон автозавершения, где:
[type autocompletion] - определяет тип завершения,
CTRL-N {next} - выбор след. варианта завершения,
CTRL-P {previous} - выбор пред. варианта завершения
```

### Типы завершения
```
CTRL-L {line} - завершение строки
CTRL-N - по ключевому слову из тек. файла
CTRL-K - по словарю (.mydict - персональный список слов)
CTRL-T {tesaurus} - по тезаурусу
CTRL-I - по ключевому слову в тек. файле и подключаемых внешн. файлах
CTRL-] - по тегу в тек. и включенных файлах
CTRL-F {file} - по имени файла только в тек. каталоге
CTRL-D {define} - по макросу в тек. и внешн. файлах (#define в C)
CTRL-V - по командам Vim
CTRL-U - по пользовательским функциям (completefunc)
CTRL-O {omni} - использует файл omni-завершения для определенных типов файлов
CTRL-S - для исправления орфографии
```

## Многооконность
> Действует мнемоника CTRL-W = Window.

### Работа с окнами
```
:[n]split [++opt] [+cmd] [file] или CTRL-W + s - разделяет окно на [n] частей, курсор помещается в новое окно
:[n]vsplit [++opt] [+cmd] [file] или CTRL-W + v - то же, что и :split, но вертикально
:[n]new [++opt] [+cmd] или CTRL-W + n - то же, что и :split, но буфер безымянный
:[n]vnew [++opt] [+cmd] - то же, что и :new, но вертикально
:[n]sview [++opt] [+cmd] [file] - то же, что и :split, но readonly
:[n]sfind [++opt] [+cmd] [file] - разделяет окно и открывает [file] в новом окне.
[n] - количество отображаемых строк в окне,
[opt] - опции Vim в сеанс работы с новым окном,
[cmd] - команда, которую надо выполнить в новом окне,
[file] - файл, который надо открыть
```

### Команды перехода между окнами
```
CTRL-W + j - переход на окно ниже
CTRL-W + k - переход на окно выше
CTRL-W + h - переход на левое окно
CTRL-W + l - переход на правое окно
CTRL-W + w - циклический преход на следующее снизу или справа окно
CTRL-W + W - циклический преход на следующее сверху или слева окно
CTRL-W + t {top} - переход в верхнее левое окно
CTRL-W + b {bottom} - переход в нижнее правое окно
CTRL-W + p {previous} - переход на предыдущее окно
```

### Перемещение окон
```
CTRL-W + r - циклический сдвиг окна вправо и вниз
CTRL-W + R - циклический сдвиг налево наверх
[n]CTRL-W + x - смена двух окон в ряду или столбце, где [n] - след. n-ое окно, с которым поменять текущее
```

### Перемещение и переформатирование окон
```
CTRL-W + K - перемещение текущее окно на верх экрана, распахивая его во всю ширину
CTRL-W + J - перемещение текущего окна в низ экарна, распахивая его во всю ширину
CTRL-W + H - перемещение текущее окно в левое положение экрана, распахивая его во всю высоту
CTRL-W + L - перемещение текущее окно в правое положение экрана, распахивая его во всю высоту
CTRL-W + T - перемещение текущее окно в новую существующую вкладку
```

### Изменение размера окна
```
CTRL-W + = - выравнивание всех окон (согласно winheight/winwidth)
CTRL-W + - - уменьшает высоту текущего окна на одну строку
:resize -[n] - уменьшает размер окна по горизонтали на [n] строк
CTRL-W + + - увеличивает высоту текущего окна на одну строку
:resize +[n] - увеличивает размер окна по горизонтали на [n] строк
z[n] + ENTER - устанавливает высоту текущего окна на [n] строк
CTRL-W + < - уменьшает ширину окна на один столбец
CTRL-W + > - увеличивает ширину окна на один столбец
:vertical resize [n] - устанавливает ширину текущего окна на [n] столбцов
CTRL-W + | - делает максимальным размер окна
```

## Работа с метками

### Базовые команды
```
m[a-Z] {mark} - поставить метку на текущую позицию
'[mark] - поместиться на начало строки с меткой [mark]
`[mark] - поместиться на символ с меткой [mark]
'' - возвращает на начало строки, содержащей предыдущую метку
`` - возвращает на предыдушую метку
```

## Редактор ex

### Базовые команды
```
p {print} - печатает строки
d {delete} - удаляет строки
m {move} - перемещает строки
co или t {copy} - копирует строки
ya {yank} - копирует строки (можно использовать с именованными буферами)
pu {put} - вствляет строки (можно использовать с именованными буферами)
j {join} - объединяет строки
```

### Адресация строк в ex

#### Явное/шаблонное указание диапазона строк
```
:[num] - переход на [num] строку
:[(start)/(/pattern1/)],[(end)/(/pattern2/)][cmd], где
[start] и [end] - числовой диапазон строк,
[pattern1] и [pattern2] - шаблоны строк,
[cmd] - команда ex
```

#### Символы адресации строк
```
. - текущая строка
$ - последняя строка файла
% - все строки
```

#### Относительные операции адресации
```
+[num] - прибавит к номеру строки число [num]
-[num] - убавит от номера строки число [num]
```

#### Вспомогательные команды адресации
```
:= - вывод числа строк
:.= - вывод текущей строки
:/pattern/= - номер следующей строки, содержащей pattern

Примечание:
Можно использовать ";" вместо ",", чтобы разделить указание диапазона от переопределения текущего положения.
```

### Глобальный поиск
```
:g - ищет глобально по шаблону и выводит найденные строки
:g!/v - противоположность g
```

### Сочетания команд ex
```
| - разделитель команд
```

### Сохранение и выход
```
:w [file] {write} - сохраняет буфер в [file] и остается в текущем редактируемом буфере ([file] - текущ. редакт.)
:sav [file] {saveas} - сохраняет текущий буфер в [file] и открывает буфер файла [file] ([file] - текущ. редакт.)
:q {quit} - выход из редактора
:wq/x - запись и выход из файла
:r [file] {read} - вставка текста из [file] в текущий буфер

Примечание:
Чтобы игнорировать системные предупреждения, нужно поставить символ ! в конце команды.
```

## Редактирование нескольких файлов

### Команды Vi
```
vi [file1] [file2] - вызов редактирования двух файлов.
```

### Команды ex
```
:next - вызов следующего файла
:args - перечисление всех файлов, присутствующих в командной строке
:rewind - делает текущим первый файл
:edit [file] - создать буфер и скопировать в него текст из [file]
% - обращение к текущему файлу (выводит его имя)
# - обращение к альтернативному файлу (выводит его имя)
```

## Глобальная замена

### Основные команды
```
s {substitute} - подстановка
g {global} - глобальность
c {confirm} - подтверждение глобальной замены
```

### Шаблон базового использования
```
:[range][command], где:
[range] - может быть как числовой диапазон, так и диапазон патернов,
[command] - любая команда(ы) ex

Примеры использования:
1) :%s/[pattern1]/[pattern2]/g
2) :g/[pattern1]/s/[pattern2]/[pattern3]/g
3) :g/[pattern1]/s//[pattern3]/g ([pattern2] = [pattern1] = blank)
```

### Метасимволы, используемые при поиске
```
. - любой одиночные символ, отличный от перевода строки
* - повторение любого количества раз символа, стоящего перед звездочкой (включая то, что символ может отсутствовать)
^ - требование нахождения в начале строки
$ - требование нахождения в конце строки
\ - экранирующий символ
[...] - любой символ, заключенный в квадратные скобки
\(...\) - сохранение шаблона, заключенного между скобками во временном буфере, к которому обращаются через \[num]
\<...\> - указание на начало (\<) или конец (\>) слова
~ - замена на последнее регулярное выражение
```

### Метасимволы, используемые при замене
```
\[num] - замена текста, соответствующего n-му шаблону
\ - экранирующий символ
& - замена на текст из поиска
~ - найденная строка заменяется на текст, определенный в последней команде подстановки
\u или \l - замена следующего символа на прописной или строчной, соответственно
(\U или \L) и (\e или \E) - такие же действия как и у \u или \l, до тех пор, пока не встретят \e, или \E, или конец строки
```

### Метасимволы расширенных регулярных выражений (ERE)
```
\| - разделяет варианты рег. выр.
\+ - соответствие одному или более предш. рег. выр.
\= - соответствие одному или ни одному предш. рег. выр.
\{n,m} - соответсвие макс. кол-ву предш. рег. выр. в диапазоне от n до m
\{-n,m} - соответсвие мин. кол-ву предш. рег. выр. в диапазоне от n до m
\+ - соотв. одному или нескольким предшествующим регулярным выражениям
```

### Трюки при заменах
```
1) :s ~ :s//~/
2) & ~ :&
3) Помимо "/" в RegExp можно использовать любой неалфавитно-цифровой символ в качестве разделителя, кроме (\, ", |)
```

### Примеры использования регулярных выражений
```
1) :%s/child\([ ,.:!?]\)/children\1/g - \1 заменит именно на тот символ, что был в квадратных скобках
2) :%s/\<child\>/children/g - отыщет только целое child
3) :%s/\(.*\)  *$/\1/g - удалит пробелы в конце строки
4) :%s/\(^[#]\+ \)\(.\)\(.+\)$/\1\U\2\e\l\3/g - после n-го количества символов #, сделает первую букву предл. заглавной
```

## Настройка редактора
> Файл vimrc содержит vimscript и ex команды. Обрабатывается редактором перед отображением файла.  

### Базовые команды
```
:source [file] - использовать команды из [file]
ex -s [vi file] < [file] - применение настроек в [file] к [vi file] из командной оболочки (-s подавляет вывод)

Примечание:
Командой :so импортируются настройки. Удобно, когда обновил vimrc и хочешь обновить текущий сеанс
или, например, создать скрипт, применяя его по-надобности при редактировании определенных файлов.
```

### Команда set
```
:set [no][option][=num] установка опции Vi, где
[no] - бинарный переключатель (если есть - 1, нет - 0)
:set all - вывод всех установок, используемых Vi
:set [option]? - вывод значения параметра [option]
:set - все заданные опции, включая те, что были заданы в текущей секции
```

### Опции

#### Отступы
```
tabstop - количество пробелов, которыми отображается символ табуляции в тексте
softtabstop - количество пробелов, которыми отображается символ табуляции при добавлении
shiftwidth - ширина отступов, добавляемых командами >> и <<
smarttab - если опция включена, то приведет к добавлению отступа при нажаети tab в начале строки равному shiftwidth
expandtab - в режиме вставки заменяет табуляцию на пробелы
autoindent - копирует отступы с текущей строки в следующую
smartindent - autoindent + учитывает особенности синтаксиса со скобками
```

#### Аббревиатуры
> Последовательности, автоматически расшифровывающиеся в режиме вставки.  

```
:ab [abbr] [phrase] {abbreviation}, где
[abbr] - аббреиватура для указанной фразы [phrase]
:unab [abbr] - отмена аббревиатуры
:ab - отображение всех аббревиатур
```

#### Отображение клавиш (mapping)
```
:map [keyboard seq] [command seq] - макрос для командного режима
:unmap [keyboard seq] - отмена макроса с [keyboard seq] для командного режима
:map - список [keyboard seq], для которых есть отображение
:map! [keyboard seq] [command seq] - макрос для режима вставки
:unmap! [keyboard seq] - отмена макроса с [keyboard seq] для режима вставки
:map #[number] [command seq] - отображение функциональной клавиши F+[number] в [command seq]
:@[name buffer] - выполнение команды, содержащейся в буффере [name buffer] (@-функция)
CTRL+V + [ENTER/ESC/BACKSPACE/DELETE/...] - экранирование управляющих клавиш
```

## Вызов UNIX команд из Vi
```
:![command] - восклицательный знак предписывает ex создать оболочку и выполнить команду [command]
:sh - создание оболочки sh (выход командой CTRL+d)

Примечание:
Вызов команд оболочки можно сочетать с :read, вставляя результат выполнения команды.
```

### man
```
SHIFT+k ~ !man [word], где [word] - слово под курсором
```

## Контроль за отступами
```
:set autoindent - повторения отступа, что и на предыдущей
CTRL+t - при включенном autoindent переводит курсор на след. уровень (в режиме вставки)
CTRL+d - при включенном autoindent переводит курсор на пред. уровень (в режиме вставки)
^ + CTRL+d - перемещение курсора на начало строки, но только для текущей
0 + СTRL+d - перемещение курсора на начало строки с изменением уровня отступа
[num] >> - смещение на [num] строк на \tab вперед
[num] << - смещение на [num] строк на \tab назад
:retab! - замена начальных пробелов на табы
```

## Теги
```
:!ctags [file] - создания файла tags, содержащего данные о местоположении импортируемой функции из файла [file]
:tag [function name] или ^] - поиск в файле tags местоположение функции [function name] и перемещение курсора на неё
CTRL+t - возвращение к сохраненному положению в стеке тегов
```

### Стеки тегов
```
:tag[!] [tagstring] - редактирование файла, содержащего [tagstring], как задано в файле тегов
:[count]tag[!] - переход на запись под номером [count] в стеке тегов
:[count]pop[!] - извлекает позицию кусора из стека, восстанавливая предыдущую позицию на [count] назад
:tags - содержимое стека тегов
:tselect[!] [tagstring] - вывод списка тегов, соответствующих [tagstring], используя информацию из файла тегов
:stselect[!] [tagstring] - такая же, как и :tselect, но разделяет окно
:[count]tnext[!] - переход на [count]-ый следующий тег
:[count]tNext[!] - переход на [count]-ый предыдущий тег
:[count]tlast[!] - переход на последующий [count]-ый тег
:[count]trewind[!] - переход на [count]-ый тег
```

## Свертки (folding)
```
:mkview - вызов сохраненных сверток
:loadview - сохранение сверток
zf[move] - создать свертку с тек. строки до той, куда переместит след. команда перемещения (manual)
[count]zf - свертка, охватывающая [count] строк (manual)
zi - переключение опции foldenable (zn, zN - вкл., выкл. соответственно)
zM ~ foldlevel = 0
zm, zr - декремент (zm) или инкремент (zr) foldlevel
zj, zk - прыжок на след. (zj) или пред. (zk) свертку
za - переключение состояния одной свертки
zo {open} - открывает одну свертку
zc {close} - закрывает одну свертку
zd {delete} - удаляет одну свертку
zA - переключение состояния сверток (скрытая/раскрытая) рекурсивно
zO {open} - открывает свертки, рекурсивно
zC {close} - закрытие свертки, рекурсивно
zD {delete} - удаление свертки, рекурсивно
zE - удаление всех сверток в файле
```

## Макросы Vi
```
q[register][macros]q - запись в [register] команды [command], где
q - символ, запускающий и оканчивающий запись в [register],
[register] - регистр, обозначающийся лат. буквами, цифрами или спец. символами,
[macros] - макрос, который кладется в регистр
[num]@[register] - вызов [num] раз макроса, хранящегося в [register] ([num] = 1)

Примечание:
Макрос прекращает работу, когда не срабатывает команда поиска символа в строке (FfTt).
```
