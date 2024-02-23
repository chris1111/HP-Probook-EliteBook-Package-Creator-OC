#!/bin/bash
# HP ProBook EliteBook Packager
# This will create a Apple Bundle App Create Install Media HP Laptop 
# Install Media HP Laptop OC Copyright (c) 2020, 2024 chris1111 All rights reserved.
# No right on OpenCore Bootloader
#
# Permission to use, copy, modify, and/or distribute this software for any
# purpose with or without fee is hereby granted, provided that the above
# copyright notice and this permission notice appear in all copies.
# THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
# WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
# MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
# ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
# WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
# ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
# OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
# Dependencies: osacompile
PARENTDIR=$(dirname "$0")
cd "$PARENTDIR"
osascript <<EOD
  display alert "Create
Install Media HP Laptop OC.app" buttons ("OK") giving up after 2
EOD
echo "= = = = = = = = = = = = = = = = = = = = = = = = =  "
echo "Create HP ProBook EliteBook Installer "
echo "= = = = = = = = = = = = = = = = = = = = = = = = =  "
Sleep 1
# Declare some VARS
APP_NAME="Install Media HP Laptop OC.app"
SOURCE_SCRIPT="Create Install Media HP Laptop.applescript"
rm -rf ./Installer/"OpenCore USB.pkg"
rm -rf rm -rf "$APP_NAMES"
rm -rf /tmp/Package-DIR
rm -rf "$APP_NAME"
Sleep 1
mkdir -p ./Installer
mkdir -p ./InstallerHP
mkdir -p ./InstallerHP/BUILD-PACKAGE
mkdir -p /tmp/Package-DIR
mkdir -p ./Ventura/V8series
# shell script Notifications
osascript -e 'display notification "Installer HP-ProBook-USB-Installer" with title "Create"  sound name "default"'
# Create the Packages with pkgbuild
pkgbuild --root ./EFIFOLDER --scripts ./Script/ScriptsESP --identifier org.opencoreUsb.EFIFOLDER.pkg --version 1 --install-location /Private/tmp/EFIROOTDIR ./InstallerHP/BUILD-PACKAGE/efifolder.pkg
pkgbuild --root ./V-BOX --scripts ./Script/ScriptsESPVBOX --identifier org.opencoreUsb.VBOX.pkg --version 1 --install-location /Private/tmp/EFIROOTDIR ./InstallerHP/BUILD-PACKAGE/vbox.pkg
pkgbuild --root ./HFS-+ --scripts ./Script/ScriptsESPHFS --identifier org.opencoreUsb.HFSPLUS.pkg --version 1 --install-location /Private/tmp/EFIROOTDIR ./InstallerHP/BUILD-PACKAGE/hfsplus.pkg
pkgbuild --root ./8-series-Haswell --scripts ./Script/Scripts8-series-Haswell --identifier org.opencoreUsb.8-series-Haswell.pkg --version 1 --install-location /Private/tmp/EFIROOTDIR ./InstallerHP/BUILD-PACKAGE/8-series-Haswell.pkg
pkgbuild --root ./Ventura/V7series --scripts ./script/Ventura/7series/Ventura --identifier com.chris1111.hpprobookelitebookmacos.V7series.pkg --version 1.0 --install-location /Private/tmp/EFIROOTDIR ./InstallerHP/BUILD-PACKAGE/V7series.pkg
pkgbuild --root ./Ventura/V8series --scripts ./script/Ventura/8series/Ventura --identifier com.chris1111.hpprobookelitebookmacos.V8series.pkg --version 1.0 --install-location /Private/tmp/EFIROOTDIR ./InstallerHP/BUILD-PACKAGE/V8series.pkg
Sleep 2
# Expend the Packages with pkgutil
pkgutil --expand ./InstallerHP/BUILD-PACKAGE/efifolder.pkg /tmp/Package-DIR/efifolder.pkg
pkgutil --expand ./InstallerHP/BUILD-PACKAGE/vbox.pkg /tmp/Package-DIR/vbox.pkg
pkgutil --expand ./InstallerHP/BUILD-PACKAGE/hfsplus.pkg /tmp/Package-DIR/hfsplus.pkg
pkgutil --expand ./InstallerHP/BUILD-PACKAGE/8-series-Haswell.pkg /tmp/Package-DIR/8-series-Haswell.pkg
pkgutil --expand ./InstallerHP/BUILD-PACKAGE/V7series.pkg /tmp/Package-DIR/V7series.pkg
pkgutil --expand ./InstallerHP/BUILD-PACKAGE/V8series.pkg /tmp/Package-DIR/V8series.pkg
Sleep 3
# Copy resources and distribution
cp -rp ./Distribution /tmp/Package-DIR
cp -rp ./Resources /tmp/Package-DIR
echo "
= = = = = = = = = = = = = = = = = = = = = = = = =
Create the final Packages with pkgutil "
Sleep 1
# Flatten the Packages with pkgutil
pkgutil --flatten /Private/tmp/Package-DIR ./Installer/"OpenCore USB.pkg"
Sleep 1
rm -rf ./InstallerHP
echo "
= = = = = = = = = = = = = = = = = = = = = = = = =
Create Install Media HP Laptop OC App"
# Create the dir structure
dir=$(cd $(dirname "$1"); pwd)
/usr/bin/osacompile -o "$APP_NAME" "$SOURCE_SCRIPT"
# Use Startup screen, LSUIElement
defaults write "$dir/$APP_NAME"/Contents/Info LSUIElement -bool true
defaults write "$dir/$APP_NAME"/Contents/Info OSAAppletShowStartupScreen -bool true
# Copy Licenses to the right place
cp License.rtf "$APP_NAME"/Contents/Resources
# Copy applet.icns to the right place
cp -rp applet.icns "$APP_NAME"/Contents/Resources
# Copy description to the right place
cp -rp description.rtfd "$APP_NAME"/Contents/Resources
# Copy Installer to the right place
cp -rp Installer "$APP_NAME"/Contents/Resources
# Copy VolumesRename, main.rtf to the right place
cp -rp Scripts/VolumesRename "$APP_NAME"/Contents/Resources/Scripts
cp -rp Scripts/main.rtf "$APP_NAME"/Contents/Resources/Scripts
# Zip app
Sleep 1
zip -r "$APP_NAME".zip "$APP_NAME"
Sleep 1
rm -rf "$APP_NAME"
unzip "$APP_NAME".zip
Sleep 1
# move app /desktop
cp -rp "$APP_NAME" $HOME/Desktop/HP-ProBook-EliteBook-Packager/"$APP_NAME"
Sleep 1
rm -rf "$APP_NAME".zip
echo " "
sleep 1
rm -rf ./Installer/"OpenCore USB.pkg"
rm -rf "$APP_NAME"
echo "
= = = = = = = = = = = = = = = = = = = = = = = = = 
Install Media HP Laptop OC.app completed
= = = = = = = = = = = = = = = = = = = = = = = = =  "
Sleep 1
echo "= = = = = = = = = = = = = = = = = = = = = = = = =  "
echo "Desktop ➤ Install Media HP Laptop OC.app
Completed Done!   "
echo "= = = = = = = = = = = = = = = = = = = = = = = = =  "
