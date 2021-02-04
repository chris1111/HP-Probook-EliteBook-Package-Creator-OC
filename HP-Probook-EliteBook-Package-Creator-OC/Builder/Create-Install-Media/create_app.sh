#!/bin/bash
# HP ProBook EliteBook Packager 
# (c) Copyright 2018 chris1111 
# This will create a Apple Bundle App Create Install Media HP Laptop 
# Dependencies: osacompile
PARENTDIR=$(dirname "$0")
cd "$PARENTDIR"

echo "= = = = = = = = = = = = = = = = = = = = = = = = =  "
echo "Create HP ProBook EliteBook Installer "
echo "= = = = = = = = = = = = = = = = = = = = = = = = =  "
Sleep 1
rm -rf ./Installer/"OpenCore USB.pkg"
rm -rf /tmp/Package-DIR
rm -rf ~/Desktop/"Install Media HP Laptop OC.app"

Sleep 1
mkdir -p ./Installer
mkdir -p ./InstallerHP
mkdir -p ./InstallerHP/BUILD-PACKAGE
mkdir -p /tmp/Package-DIR

# shell script Notifications
osascript -e 'display notification "Installer HP-ProBook-USB-Installer" with title "Create"  sound name "default"'


# Create the Packages with pkgbuild
pkgbuild --root ./EFIFOLDER --scripts ./Script/ScriptsESP --identifier org.opencoreUsb.EFIFOLDER.pkg --version 1 --install-location /Private/tmp/EFIROOTDIR ./InstallerHP/BUILD-PACKAGE/efifolder.pkg
pkgbuild --root ./V-BOX --scripts ./Script/ScriptsESPVBOX --identifier org.opencoreUsb.VBOX.pkg --version 1 --install-location /Private/tmp/EFIROOTDIR ./InstallerHP/BUILD-PACKAGE/vbox.pkg
pkgbuild --root ./HFS-+ --scripts ./Script/ScriptsESPHFS --identifier org.opencoreUsb.HFSPLUS.pkg --version 1 --install-location /Private/tmp/EFIROOTDIR ./InstallerHP/BUILD-PACKAGE/hfsplus.pkg
Sleep 2
# Expend the Packages with pkgutil
pkgutil --expand ./InstallerHP/BUILD-PACKAGE/efifolder.pkg /tmp/Package-DIR/efifolder.pkg
pkgutil --expand ./InstallerHP/BUILD-PACKAGE/vbox.pkg /tmp/Package-DIR/vbox.pkg
pkgutil --expand ./InstallerHP/BUILD-PACKAGE/hfsplus.pkg /tmp/Package-DIR/hfsplus.pkg
Sleep 3
# Copy resources and distribution
cp -rp ./Distribution ./InstallerHP/BUILD-PACKAGE/Distribution.xml
cp -rp ./Resources ./InstallerHP/BUILD-PACKAGE

echo "
= = = = = = = = = = = = = = = = = = = = = = = = =
Create the final Packages with Productbuild "
Sleep 3
# Create the final Packages with Productbuild
productbuild --distribution "./InstallerHP/BUILD-PACKAGE/Distribution.xml"  \
--package-path "./InstallerHP/BUILD-PACKAGE/" \
--resources "./InstallerHP/BUILD-PACKAGE/Resources" \
"./Installer/OpenCore USB.pkg"
rm -rf ./InstallerHP


# Declare some VARS
APP_NAME="Install Media HP Laptop OC.app"
SOURCE_SCRIPT="Create Install Media HP Laptop.applescript"

# Create the dir structure
/usr/bin/osacompile -o "$APP_NAME" "$SOURCE_SCRIPT"

# Copy Licenses to the right place
cp License.rtf "$APP_NAME"/Contents/Resources

# Copy applet.icns to the right place
cp -rp applet.icns "$APP_NAME"/Contents/Resources

# Copy description to the right place
cp -rp description.rtfd "$APP_NAME"/Contents/Resources

# Copy Installer to the right place
cp -rp Installer "$APP_NAME"/Contents/Resources

# Copy applet to the right place
cp -rp applet.rsrc "$APP_NAME"/Contents/Resources

# Copy main.rtf to the right place
cp -rp ./Scripts/main.rtf "$APP_NAME"/Contents/Resources/Scripts

# Copy Info.plist make LSUIElement=true
cp -rp Info.plist "$APP_NAME"/Contents

# move app to /tmp
mv ./"Install Media HP Laptop OC.app" $HOME/Desktop/"Install Media HP Laptop OC.app"

Sleep 1
# Change icons
./icon.py ./HP-Icon.icns $HOME/Desktop/"Install Media HP Laptop OC.app"


Sleep 1
rm -rf ./Installer/"OpenCore USB.pkg"

# Avoid issue opening the app
xattr -cr ~/Desktop/"Install Media HP Laptop OC.app"
rm -rf ~/Desktop/"Install Media HP Laptop OC.app/Icon"

echo "
= = = = = = = = = = = = = = = = = = = = = = = = = 
Install Media HP Laptop OC.app completed
= = = = = = = = = = = = = = = = = = = = = = = = =  "


Sleep 1
echo "= = = = = = = = = = = = = = = = = = = = = = = = =  "
echo "Desktop ➤ Install Media HP Laptop OC.app
Completed Done!   "
echo "= = = = = = = = = = = = = = = = = = = = = = = = =  "

