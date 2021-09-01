#!/bin/bash
# Command Line EFI Mounter
# (c) Copyright 2016 chris1111 
#
BOLD="\033[1m"
RED="\033[1;31m"
GREEN="\033[1;32m"
BLUE="\033[1;34m"
OFF="\033[m"

#
# Repository location
#
REPO=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )


echo "———————————————————————————————————————————————————————————————————————————————"

sudo diskutil list 

echo "———————————————————————————————————————————————————————————————————————————————"
printf "Enter the Number of the partition follow by [ENTER]. (Exemple) ${RED}disk1s1${OFF}"

echo "  "

echo "                 ===== The choose Partition Will be Mounted! ====="
echo "———————————————————————————————————————————————————————————————————————————————"

read -p ": " target
sudo diskutil mount ${target}


echo "———————————————————————————————————————————————————————————————————————————————"
echo "`tput setaf 7``tput sgr0``tput bold``tput setaf 26`Mounted. . . .`tput sgr0` `tput setaf 7``tput sgr0`" 
echo "———————————————————————————————————————————————————————————————————————————————"
Sleep 2	





 






