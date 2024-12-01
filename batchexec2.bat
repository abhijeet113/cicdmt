SETLOCAL ENABLEDELAYEDEXPANSION
cd C:\Users\shind\AppData\Roaming\npm\npm
for /f "tokens=*" %%i in ('zowe zos-jobs submit data-set
"HLQ1.HLQ2.JOBS (REXEXC00)" --wfo --rff retcode --rft string') do set RC=%%1 
if "%RC%"="CC 0001" (
for /f "tokens=*" %i in ('zowe zos-jobs submit data-set 
"HLQ1.HLQ2.JOBS (REXEXC01)" --wfo --rff retcode --rft string') do set RC=%%1
 )
if %RC%"=="CC 0000" (
for /f "tokens=*" %i in ('zowe zos-jobs submit data-set 
"HLQ1.HLQ2.JOBS (REXEXC02)" --wfo --rff retcode --rft string') do set RC=%%1
 )
if "SRC"=="CC 0001" (
for /f "tokens=*" %i in ('zowe zos-jobs submit data-set 
"HLQ1.HLQ2.JOBS (REXEXC03)" --wfo --rff retcode --rft string') do set RC=%%1
)
if "RC="CC 0000" (
echo ALL JOBS DID'T RUN!
)