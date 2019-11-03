@ECHO OFF

REM ****************************** 
REM * 	      PAWEŁ SKIBA        *
REM *  SKRYPT POWŁOKI TEKSTOWEJ  *
REM *  	   LABORATORIUM NR 3     *
REM *      SYSTEMY OPERACYJNE    *
REM ******************************

Title skrypt.bat

goto :checkNumberOfArguments
:returnCheckNumberOfArguments

goto :showEnvironmentVariables
:returnShowEnvironmentVariables

ECHO Wersja powloki:
if "%shell%" == "TCC" ver
if "%shell%" == "cmd" ver
if "%shell%" == "command" ver
if "%shell%" == "powershell" $PSVersionTable
ECHO __________________________________________________________________________

if not "%shell%" == "TCC" goto :incorrectShell
pause

EXIT /B 0


:checkNumberOfArguments
set numberOfArguments=0
for %%x in (%*) do set /A numberOfArguments +=1
echo Liczba argumentow wejsciowych %numberOfArguments%
goto :returnCheckNumberOfArguments

:showEnvironmentVariables
ECHO __________________________________________________________________________
ECHO 			   INFORMACJE OGOLNE
ECHO __________________________________________________________________________ & ECHO:
ECHO Wartosc zmiennej COMSPEC: &ECHO:&ECHO:%COMSPEC% & ECHO:
for %%1 in (%COMSPEC%) do (
    set shell=%%~n1
)
ECHO Uzywana powloka: & ECHO: & ECHO:%shell% & ECHO: 
goto :returnShowEnvironmentVariables

:incorrectShell
ECHO Powloka %shell% nie jest wspierana. Skorzystaj z powloki TCC.
ECHO __________________________________________________________________________
pause