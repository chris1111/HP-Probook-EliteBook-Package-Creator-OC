#!/bin/sh

nameh=`users`
function echob() {
  echo "`tput bold`$1`tput sgr0`"
}

function head
{
clear
echo "          ***************************************************************"                      
       echo "          ***************** `tput setaf 7``tput sgr0``tput bold``tput setaf 26`Command Line EFI Mounter`tput sgr0` `tput sgr0` `tput setaf 7``tput sgr0`*******************`tput sgr0` `tput setaf 7``tput sgr0` "  
echo "          ***************************************************************"
}

function menu
{
echo "                                     Welcome " 
echo "                                      $nameh "                                                               
echo " "
echo "                                 Type A to start "
echo "                                 Type X to quit  "                            
echo "                                                 "                                 
echo "                                A - MOUNT EFI - "
echo "                                X - QUIT PROGRAM - "
echo "
          ***************************************************************                      `tput setaf 7``tput sgr0``tput bold``tput setaf 26`            © Copyright 2016 chris1111  `tput sgr0` `tput setaf 7``tput sgr0`      
          *************************************************************** "         

read -n 1 option
}
function COMMAND_LINE_EFI_MOUNTER
{
head
echo " "
echo "Command Line EFI Mounter"
./CommandLineEFIMounter.sh
echo " "
echo "`tput setaf 7``tput sgr0``tput bold``tput setaf 26`EFI Succeed Mounted!`tput sgr0` `tput setaf 7``tput sgr0`"
echo " "
}
function Quit
{
clear
echo " " 
echo "
Quit Command Line EFI Mounter."

osascript -e 'tell app "terminal" to display dialog "Good By" with icon file "System:Library:CoreServices:loginwindow.app:Contents:Resources:ShutDown.tiff" buttons {"Logout"} default button 1 with title "Command Line EFI Mounter"'
echo " " 
echob "Good By $hours `tput setaf 7``tput sgr0``tput bold``tput setaf 10`$nameh`tput sgr0` `tput setaf 7``tput sgr0`"
echo " " 
exit 0
}
while [ 1 ]
do
head
menu
case $option in

a|A)
echo
COMMAND_LINE_EFI_MOUNTER ;;
x|X)
echo
Quit ;;


*)
echo ""
esac
echo
echob "`tput setaf 7``tput sgr0``tput bold``tput setaf 10`Type any key to return.`tput sgr0` `tput setaf 7``tput sgr0`"
echo
read -n 1 line
clear
done

exit




	
