#!/bin/bash
# HP ProBook EliteBook Packager
# (c) Copyright 2018, 2021 chris1111
PARENTDIR=$(dirname "$0")
cd "$PARENTDIR"
# Vars
apptitle="HP ProBook EliteBook Packager"
version="1.0"
# Set Icon directory and file
export ICNS=$(dirname "${0}")
iconfile="$ICNS/AppIcon.icns"

rm -rf $HOME/Desktop/HP-ProBook-EliteBook-Packager
Sleep 1
mkdir -p $HOME/Desktop/HP-ProBook-EliteBook-Packager
Sleep 1
./Create-Install-Media/create_app.sh
Sleep 1
./HPProBookEliteBookmacOS/HP-ProBook-EliteBook-Package-Creator.sh
Sleep 1

# Done
response=$(osascript -e 'tell app "System Events" to display dialog "HP ProBook EliteBook Packager
Done!\n" buttons {"Done"} default button 1 with title "'"$apptitle"' '"$version"'" with icon POSIX file "'"$iconfile"'" giving up after 10 ')

action=$(echo $response | cut -d ':' -f2)

Open $HOME/Desktop/HP-ProBook-EliteBook-Packager
Sleep 1


