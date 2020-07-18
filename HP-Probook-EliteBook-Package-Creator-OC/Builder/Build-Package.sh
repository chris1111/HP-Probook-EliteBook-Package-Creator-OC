#!/bin/bash
# HP ProBook EliteBook Packager 
# (c) Copyright 2018 chris1111

if [[ $(mount | awk '$3 == "/Volumes/HP-ProBook-EliteBook-macOS" {print $3}') != "" ]]; then
 hdiutil detach "/Volumes/HP-ProBook-EliteBook-macOS"
fi

hdiutil attach -nobrowse ./Builder/"HP ProBook EliteBook macOS.dmg"
Sleep 2
cd /Volumes/HP-ProBook-EliteBook-macOS
./Build/BUILDER.sh

echo " "
echo "
= = = = = = = = = = = = = = = = = = = = = = = = =  
Desktop ➤  HP-ProBook-EliteBook-macOS
Desktop ➤  HP-ProBook-EliteBook-macOS.pkg
Completed Done!   
= = = = = = = = = = = = = = = = = = = = = = = = =  "
