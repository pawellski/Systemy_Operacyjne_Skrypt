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



ECHO --------------------------------------------------------------------------
ECHO Wartosc zmiennej COMSPEC: %COMSPEC%
ECHO Uzywana powloka:
for %%1 in (%COMSPEC%) do echo %%~nx1
ECHO --------------------------------------------------------------------------
EXIT /B 0


:checkNumberOfArguments
set numberOfArguments=0
for %%x in (%*) do set /A numberOfArguments +=1
echo Liczba argumentow wejsciowych %numberOfArguments%
goto :returnCheckNumberOfArguments