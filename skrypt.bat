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

goto :Help
:returnHelp

if %numberOfArguments% EQ 2 goto :chooseFunction
:returnChooseFunction

ECHO Nieprawidlowe argumenty!
ECHO __________________________________________________________________________
goto :DisplayHelp

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
goto :Help

:Help
if "%~1"=="/?" goto :DisplayHelp
if "%~1"=="/h" goto :DisplayHelp
if "%~1"=="/help" goto :DisplayHelp
if "%~1"=="-?" goto :DisplayHelp
if "%~1"=="-h" goto :DisplayHelp
if "%~1"=="-help" goto :DisplayHelp
if "%shell%" == "TCC" goto :returnHelp
ECHO Nieprawidlowe argumenty!
ECHO __________________________________________________________________________
goto :DisplayHelp

:DisplayHelp
ECHO HELP & ECHO:
ECHO Uruchomienie skrytpu:
ECHO .\skrypt.bat (- ^| /)(h ^| help ^| ?) - wyswietlenie pomocy
ECHO .\skrypt.bat (-abs ^| -ABS) liczba - uruchomienie funkcji ABS
ECHO .\skrypt.bat (-int ^| -INT) liczba - uruchomienie funkcji INT
ECHO .\skrypt.bat (-decimal ^| -DECIMAL) liczba - uruchomienie funkcji DECIMAL & ECHO:
ECHO Argumenty:
ECHO Argument "liczba" musi byc wprowadzony w formacie x^^,y
ECHO ^> gdzie x to czesc calkowita reprezentowana przez n cyfr z zakresu 0-9
ECHO ^> gdzie y to czesc dziesietna reprezentowana przez m cyfr z zakresu 0-9
ECHO __________________________________________________________________________
EXIT /B 0

:chooseFunction
if "%~1" == "-ABS" goto :ABS	
if "%~1" == "-abs" goto :ABS
	
if "%~1" == "-INT" goto :INT
if "%~1" == "-int" goto :INT
	
if "%~1" == "-DECIMAL" goto :DECIMAL	
if "%~1" == "-decimal" goto :DECIMAL

goto :returnChooseFunction


:ABS
if %@NUMERIC[%~2]==0 goto :badNumber
ECHO Wprowadzona liczba: %~2
ECHO Wartosc zwracana przez funkcje @ABS: %@ABS[%~2]
ECHO __________________________________________________________________________
EXIT /B 0

:INT
if %@NUMERIC[%~2]==0 goto :badNumber
ECHO Wprowadzona liczba: %~2
ECHO Wartosc zwracana przez funkcje @INT: %@INT[%~2]
ECHO __________________________________________________________________________
EXIT /B 0

:DECIMAL
if %@NUMERIC[%~2]==0 goto :badNumber
ECHO Wprowadzona liczba: %~2
ECHO Wartosc zwracana przez funkcje @DECIMAL: %@DECIMAL[%~2]
ECHO __________________________________________________________________________
EXIT /B 0

:badNumber
echo 2 arg nie jest liczba
ECHO __________________________________________________________________________
EXIT /B 0