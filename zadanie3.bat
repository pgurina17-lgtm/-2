@echo off
setlocal EnableDelayedExpansion

if "%1"=="" (
    echo Ошибка: укажите каталог!
    echo Пример: %0 C:\Users
    pause
    goto :eof
)

set count=0

for /r "%1" /d %%d in (*) do (
    set /a count=count+1
)

echo Количество подкаталогов: %count%
pause