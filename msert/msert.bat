:: Author : EHO - Deepdef
:: Last Update : 12/05/2022
:: Purpose : Run MSFT silent scanner only if log file is not present or size less than 2kb. ( ~ not empty)

if not exist C:\Windows\debug\msert.log ( \\serveur01\packages\MSERT\MSERT.exe /Q &goto :eof )
set "file=C:\Windows\debug\msert.log"
set  MSIZE=2000 
FOR %%A IN (%file%) DO set size=%%~zA  
if %size% LSS %MSIZE% \\serveur01\packages\MSERT\MSERT.exe /Q
