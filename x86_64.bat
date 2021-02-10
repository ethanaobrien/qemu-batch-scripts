@echo off
echo 'This script is for x86_64 systems (64 or 32 bit)'
echo 'Only raw images (.raw .iso .img) can be loaded using this script'
set /P NAME='What is the name of the HARD DISK? (iso disk next) INCLUDE THE FILE TYPE! Example: .img (It MUST be on your desktop!!)'
set /P RAM='How much ram do you want to give the system in MiB? (512 recommended)'


:start
SET choice=
SET /p choice='Do you want to mount an iso? y,n' [N]: 
IF NOT '%choice%'=='' SET choice=%choice:~0,1%
IF '%choice%'=='Y' GOTO yes
IF '%choice%'=='y' GOTO yes
IF '%choice%'=='N' GOTO no
IF '%choice%'=='n' GOTO no
IF '%choice%'=='' GOTO no
ECHO "%choice%" is not valid
ECHO.
GOTO start


:yes
set /P ISONAME='What is the name of the iso disk? INCLUDE THE FILE TYPE! Example: .iso (It MUST be on your desktop!!) THIS DISK WILL BE READ ONLY!!'
%USERPROFILE%\desktop\qemu\qemu-system-x86_64.exe -m %RAM% -drive format=raw,file=%USERPROFILE%\desktop\%NAME% -drive format=raw,media=cdrom,readonly,file=%USERPROFILE%\desktop\%ISONAME%




:no
%USERPROFILE%\desktop\qemu\qemu-system-x86_64.exe -m %RAM% -drive format=raw,file=%USERPROFILE%\desktop\%NAME%