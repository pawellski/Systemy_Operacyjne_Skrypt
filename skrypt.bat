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


if not "%shell%" == "TCC" goto :incorrectShell



EXIT /B 0


:checkNumberOfArguments
set numberOfArguments=0
for %%x in (%*) do set /A numberOfArguments +=1
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
ECHO Wersja powloki:
if "%shell%" == "TCC" ver
if "%shell%" == "cmd" ver
if "%shell%" == "command" ver
if "%shell%" == "powershell" $PSVersionTable
ECHO __________________________________________________________________________
goto :returnShowEnvironmentVariables

:incorrectShell
ECHO Powloka %shell% nie jest wspierana. Skorzystaj z powloki TCC.
ECHO __________________________________________________________________________
if %numberOfArguments% == 1 goto :Help
ECHO Nieprawidlowe argumenty!
ECHO __________________________________________________________________________
goto :DisplayHelp
ECHO __________________________________________________________________________
EXIT /B 0

:Help
if "%~1"=="/?" goto :DisplayHelp
if "%~1"=="/h" goto :DisplayHelp
if "%~1"=="/help" goto :DisplayHelp
if "%~1"=="-?" goto :DisplayHelp
if "%~1"=="-h" goto :DisplayHelp
if "%~1"=="-help" goto :DisplayHelp
ECHO Nieprawidlowe argumenty!
ECHO __________________________________________________________________________
goto :DisplayHelp

:DisplayHelp
ECHO HELP
ECHO %0% (- ^| /)(h ^| help ^| ?) - wyswietlenie pomocy
ECHO %0% (-abs ^| -ABS) liczba - uruchomienie funkcji ABS
ECHO %0% (-int ^| -INT) liczba - uruchomienie funkcji INT
ECHO %0% (-decimal ^| -DECIMAL) liczba - uruchomienie funkcji DECIMAL
ECHO __________________________________________________________________________
EXIT /B 0
