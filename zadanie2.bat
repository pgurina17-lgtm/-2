@ECHO OFF
SETLOCAL ENABLEDELAYEDEXPANSION

SET /A min=0
SET /A max=0
SET first=1

ECHO Vvedite chisla (dlya vyhoda vvedite -):

:Loop
SET /P input="Vvedite chislo: "

IF "!input!"=="-" GOTO PrintResult

REM Проверка, что введено число (упрощенная)
SET /A num=!input! 2>NUL
IF ERRORLEVEL 1 (
    ECHO Eto ne chislo.
    GOTO Loop
)

IF !first! EQU 1 (
    SET /A min=!num!
    SET /A max=!num!
    SET first=0
) ELSE (
    IF !num! LSS !min! SET /A min=!num!
    IF !num! GTR !max! SET /A max=!num!
)

GOTO Loop

:PrintResult
IF !first! EQU 1 (
    ECHO Chisla ne byli vvedeny.
) ELSE (
    ECHO Minimum: !min!
    ECHO Maximum: !max!
)

ENDLOCAL
PAUSE