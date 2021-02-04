#!/bin/sh
nameh=`users`
function echob() {
  echo "`tput bold`$1`tput sgr0`"
}
function head
{
clear
echo "                        `tput setaf 7``tput sgr0``tput bold``tput setaf 26`  © Copyright 2020 chris1111`tput sgr0` `tput setaf 7``tput sgr0`"
         echo "              = = = = = = = = = = = = = = = = = = = = = = = = =  "
                   
echo "                    `tput setaf 7``tput sgr0``tput bold``tput setaf 26` \033[5mHP ProBook EliteBook Package Creator OC`tput sgr0` `tput setaf 7``tput sgr0`\033[0m"
         echo "              = = = = = = = = = = = = = = = = = = = = = = = = =  "
echo " "
}
function menu
{
echo "             Welcome "`tput setaf 7``tput sgr0``tput bold``tput setaf 26`$nameh`tput sgr0` `tput setaf 7``tput sgr0`", HP ProBook EliteBook Package Creator OC "
echo " "
echo "                       `tput setaf 26`
                  ===========================================
                  - Credit Tester: asdesoso, RegieMac, Axon, jeremy 94, Paul, 
                    sajtos888, Bogey, djams.
                  - Credit: Old project Tester Screenz, mus68, MueKo,
                    platinumsteel, doodoo94, jeremy19, arno608rw
                  - Credit: RehabMan for all DSDT patch
                  - Credit: Kext Devs rehabman, vit9696, Mieze, lvs1974 
                  - Credit: Intel for IASL
                  - Credit: rehabman for patchmatic
                  - Credit: Apple for pkgbuild
                  - Credit: OC team for OpenCore 
                  ==========================================="
echo " "
echo "                   Type A  Build HP-ProBook-EliteBook-macOS.pkg "
echo "                   Type B  Build Install Media HP Laptop OC.app "
echo "                   Type X  EXIT Programme "
                      

echo "                  ===========================================  "

echo "                   `tput setaf 7``tput sgr0``tput bold``tput setaf 26` \033[5mHP ProBook EliteBook Package Creator OC`tput sgr0` `tput setaf 7``tput sgr0`\033[0m"
echo "               = = = = = = = = = = = = = = = = = = = = = = = = =  "

read -n 1 option
}
function PACKAGE
{
head
echo " "
echo "Build Package "
echo "
= = = = = = = = = = = = = = = = = = = = = = = = =  
File System Check   
= = = = = = = = = = = = = = = = = = = = = = = = =  "
/usr/libexec/PlistBuddy -c "Print :FilesystemType" /dev/stdin <<< $(diskutil info -plist /)
Sleep 2
./Builder/Build-Package.sh
echo " "
}
function INSTALLER
{
head
echo " "
echo "Build Install Media HP Laptop OC.app"
./Builder/Create-Install-Media/create_app.sh
echo " "
}
function Quit
{
clear
echo " " 
echo "
Quit Programme"
echo " " 
echob "Thanks`tput setaf 7``tput sgr0``tput bold``tput setaf 26` $hours $nameh`tput sgr0` `tput setaf 7``tput sgr0`"
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
PACKAGE ;;
b|B)
echo
INSTALLER ;;
x|X)
echo
Quit ;;

*)
echo ""
esac
echo
echob "`tput setaf 7``tput sgr0``tput bold``tput setaf 26`Tye any key to return to menue`tput sgr0` `tput setaf 7``tput sgr0`"
echo
read -n 1 line
clear
done

exit




	
