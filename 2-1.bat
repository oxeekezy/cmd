@rem отключаем собаки
@echo off

rem Проверяем на ввод аргументы
if %1/==/ goto Exit
if %2/==/ goto Exit
if %3/==/ goto Exit
if %4/==/ goto Exit

rem Проверяем директории на наличие и 4 на отстутвие 
if not exist %1 goto FileNotExist1
if not exist %2 goto FileNotExist2
if exist %4 goto FileExist

rem ищем строку 
findstr /i /c:%3 %1 %2 > %4

rem копируем/выводим
copy %4 ..\..\
type ..\..\%4

rem завершаем
goto :EOF

rem метка от пустых значений 
:Exit
echo Bad arguments
goto :EOF

rem метка отстувия певрого файла
:FileNotExist1
echo File %1 non exist!
goto :EOF

rem метка отстувия второго файла
:FileNotExist2
echo File %2 non exist!
goto :EOF

rem результат уже есть
:FileExist
echo File %4 exist!
goto :EOF