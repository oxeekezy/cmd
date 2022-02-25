@echo off

rem проверяем агрументы
if %1/==/ goto NoArgument
if %2/==/ goto NoArgument

rem прверяем наличие файла
if not exist %2 goto FileNotExist

rem задаёт аттрибуты выполнения
if %1==C goto copy 
if %1==R goto rename 
if %1==D goto delete 

rem копирование
:copy
echo Copy %2 to current dir
if %3/==/ goto NoArgument
copy %2 ..\..\%3
copy %2 %3 
goto Next

rem переименование
:rename
if %3/==/ goto NoArgument
echo Rename %2 to %3..
if exist %3 (move %2 ..\) else (ren %2 %3)


goto Next

rem удаляем 
:delete
echo Deleting %2 
del %2

rem Удачное выполнение 
:Next 
echo Success!
goto :EOF

rem Нехватка аргументов
:NoArgument
echo Bad arguments
goto :EOF

rem файла нет
:FileNotExist
echo File %2 non exist!
goto :EOF
