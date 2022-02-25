@chcp 1251
@echo off

rem Проверяем наличие аргументов
if %1/==/ goto NoArgument
if %2/==/ goto NoArgument
if %3/==/ goto NoArgument

dir

rem Проверяем наличие директории
if not exist %1 mkdir %1
if exist %3 goto FileExist

rem Если файла нет -> записываем в новый
echo %2 > %3
goto :FileNotExist

rem Если файл есть -> дозаписываем
:FileExist
echo %2 >> %3

:FileNotExist
rem Ищем
FC *%~X3 %3

if errorlevel 1 (type %3 & echo Done & goto :EOF) else (echo Error & goto :EOF)

:Bad
echo Missing arguments
goto :EOF




