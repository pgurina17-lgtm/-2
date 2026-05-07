@echo off
cls
color 0A

echo ========================================
echo    VYCHISLENIE FAKTORIALA
echo ========================================
echo.

:: Проверка: введено ли число
if "%1" == "" (
    echo OSHIBKA: Ne ukazano chislo!
    echo Primer: %~nx0 5
    echo.
    set /p "num=Vvedite chislo vruchnuyu: "
) else (
    set num=%1
)

:: Проверка на отрицательное число
echo %num%| findstr /r "^-[0-9][0-9]*$" >nul
if %errorlevel% equ 0 (
    echo OSHIBKA: Faktorial ne opredelen dlya otritsatelnyh chisel!
    pause
    exit /b
)

:: Проверка на 0 (0! = 1)
if "%num%"=="0" (
    echo.
    echo 0! = 1
    echo.
    pause
    exit /b
)

:: Расчет через PowerShell (чтобы не было ошибок с большими числами)
for /f "delims=" %%A in ('powershell -command "$f=[bigint]1; for($i=1; $i -le %num%; $i++){$f *= $i}; $f"') do set result=%%A

echo.
echo Rezultat: %num%! = %result%
echo.

pause
