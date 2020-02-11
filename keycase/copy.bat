@echo off
:: disclaimer
echo this action will:
echo 1 extract all files and directories in the encrypted folder
echo 2 do not make any changes to the encrypted folder
echo 3 the author shall not be liable for any loss arising from the use
echo ------------------------------------------------------------------------
setlocal enabledelayedexpansion
rem start the script
set /p e=please enter the locked folder:
:: /s for recursive the folder
for /f "delims=" %%i in ('dir /ad /b') do (
:: /i for case insensitive
set t=%%~ni
:: call echo %%t%%
if "!t!" equ "!e!" (
set s=%%i
goto process
)
)
rem ignore normal folder
echo folder does not exist
goto end
rem processing
:process
:: format date time 
set p=%date:~0,10% %time:~0,8%
set p=%p:/=.%
set p=%p::=.%
xcopy /e/q/h "%s%" "%~dp0%t% %p%\"
echo process down
:end
rem complete
echo enjoy it
pause
@echo on
rem end of all
exit
