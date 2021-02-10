@echo off
set /P NAME="What do you want to name the disk "
set /P SIZE="How big would you like the disk to be? (In Gb) "
qemu-img create -f raw %USERPROFILE%\Desktop\%NAME%.img %SIZE%G