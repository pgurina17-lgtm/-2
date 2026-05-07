@echo off
chcp 65001 > nul
cls

if "%1"=="" (
    echo Не указана папка
    goto :eof
)

if "%2"=="" (
    echo Не указано расширение
    goto :eof
)

echo Файлы с расширением .%2 в папке %1:
echo.

for %%f in ("%1\*.%2") do echo %%~nxf