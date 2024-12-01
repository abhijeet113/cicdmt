@echo off
REM Change to the directory where the files will be downloaded
cd /d C:\rexx\cicdmt

REM Download the datasets using Zowe CLI
echo Downloading datasets...
zowe zos-files download ds "z52677.jcl(rexexc00)" --file "./rexexec00.txt"
zowe zos-files download ds "z52677.jcl(rexexc01)" --file "./rexexec01.txt"
zowe zos-files download ds "z52677.jcl(rexexc02)" --file "./rexexec02.txt"
zowe zos-files download ds "z52677.jcl(rexexc03)" --file "./rexexec03.txt"

REM Stage the files using Git
echo Adding files to Git...
git add .

REM Commit the changes
set /p commitMessage="Enter commit message: "
git commit -m "%commitMessage%"

REM Push the changes to the remote repository
echo Pushing changes to remote repository...
git push

REM Completion message
echo All operations completed successfully!
pause
