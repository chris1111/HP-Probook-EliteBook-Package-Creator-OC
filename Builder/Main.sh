#!/bin/bash
# HP ProBook EliteBook Packager
# (c) Copyright 2018, 2024 chris1111
PARENTDIR=$(dirname "$0")
cd "$PARENTDIR"
# Vars
apptitle="HP ProBook EliteBook Packager"
version="1.0"
# Set Icon directory and file
export ICNS=$(dirname "${0}")
iconfile="$ICNS/AppIcon.icns"
# Creating log file
install_log="/Private/tmp/HP-Probook-EliteBook_Log.txt"
rm -rf install_log
touch $install_log
echo "======================================================" >> "$install_log"
echo "HP ProBook EliteBook Packager log - $( date )" >> "$install_log"
echo "=====================================================" >> "$install_log"

# Desacactivate Term
osascript <<EOD
  tell application "Finder"
	set visible of process "Terminal" to false
end tell
EOD

# Activate App
osascript <<EOD
  tell application "HP-ProBook-EliteBook"
      activate
  end tell
EOD

rm -rf $HOME/Desktop/HP-ProBook-EliteBook-Packager
Sleep 1
mkdir -p $HOME/Desktop/HP-ProBook-EliteBook-Packager
Sleep 1
echo "======================================================" >> "$install_log"
./Create-Install-Media/create_app.sh >> "$install_log"
Sleep 1
# Activate App
osascript <<EOD
  tell application "HP-ProBook-EliteBook"
      activate
  end tell
EOD
echo "======================================================" >> "$install_log"
./HPProBookEliteBookmacOS/HP-ProBook-EliteBook-Package-Creator.sh >> "$install_log"
Sleep 1

# Done
response=$(osascript -e 'tell app "System Events" to display dialog "HP ProBook EliteBook Packager
Build completed
Done!\n" buttons {"Done"} default button 1 with title "'"$apptitle"' '"$version"'" with icon POSIX file "'"$iconfile"'" giving up after 10 ')

action=$(echo $response | cut -d ':' -f2)

Open $HOME/Desktop/HP-ProBook-EliteBook-Packager
# Activate App
osascript <<EOD
  tell application "HP-ProBook-EliteBook"
      activate
  end tell
EOD

Sleep 1
osascript <<EOD
delay 3
tell application "HP-ProBook-EliteBook"	quitend tell
EOD

echo "======================================================" >> "$install_log"
echo "HP ProBook EliteBook Packager log Completed" >> "$install_log"
echo "======================================================" >> "$install_log"

cp $install_log $HOME/Desktop/HP-ProBook-EliteBook-Packager/HP-Probook-EliteBook_Log.txt
Sleep 1 
rm -rf $install_log
Open -R $HOME/Desktop/HP-ProBook-EliteBook-Packager/HP-Probook-EliteBook_Log.txt

exit 0
