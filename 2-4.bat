@echo off
REM Выполнение командного файла

rem проверяем название файла
IF %1/==/ GOTO Exit

rem Проверяем есть в директории или нет
IF NOT EXIST %1 GOTO NotExist
GOTO exist

rem если нет вводи с клавиатуры
:NotExist
echo [KEYBORD MODE]File %1 not exist:
copy con %1

rem если есть запускаем
:exist
type %1

rem выводим название файла
echo Start: %1

echo Success

rem завершаем
GOTO :EOF
:Exit
echo No arguments