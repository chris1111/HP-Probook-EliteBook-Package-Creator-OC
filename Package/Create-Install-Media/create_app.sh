#!/bin/bash
#
# HP ProBook EliteBook Packager
# This will create an Apple Bundle App: Create Install Media HP Laptop
# Install Media HP Laptop OC Copyright (c) 2020, 2026 chris1111 All rights reserved.
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
#
# Dependencies: osacompile, pkgbuild, pkgutil
#

set -u

# Always run from the script's own folder
cd "$(dirname "$0")" || exit 1

# ---------------------------------------------------------------------------
# Config — edit here only
# ---------------------------------------------------------------------------
APP_NAME="Install Media HP Laptop OC.app"
SOURCE_SCRIPT="Create Install Media HP Laptop.applescript"
USB_PKG="./Installer/OpenCore USB.pkg"
BUILD_STAGE="./InstallerHP/BUILD-PACKAGE"
PKG_DIR="/tmp/Package-DIR"          # Package-DIR (with dash) in THIS script
OUT_APP_DIR="$HOME/Desktop/HP-ProBook-EliteBook-Packager"

# Directory of the script (or of $1 when the parent App passes one) —
# used for the defaults write paths below
dir="$(cd "$(dirname "${1:-$0}")" && pwd)"

# ---------------------------------------------------------------------------
# Package table:  root | scripts | full identifier | version | output
# ---------------------------------------------------------------------------
PACKAGES=(
    './EFIFOLDER|./Script/ScriptsESP|org.opencoreUsb.EFIFOLDER.pkg|1|efifolder.pkg'
    './V-BOX|./Script/ScriptsESPVBOX|org.opencoreUsb.VBOX.pkg|1|vbox.pkg'
    './HFS-+|./Script/ScriptsESPHFS|org.opencoreUsb.HFSPLUS.pkg|1|hfsplus.pkg'
    './8-series-Haswell|./Script/Scripts8-series-Haswell|org.opencoreUsb.8-series-Haswell.pkg|1|8-series-Haswell.pkg'
    './Ventura/V7series|./script/Ventura/7series/Ventura|com.chris1111.hpprobookelitebookmacos.V7series.pkg|1.0|V7series.pkg'
    './Ventura/V8series|./script/Ventura/8series/Ventura|com.chris1111.hpprobookelitebookmacos.V8series.pkg|1.0|V8series.pkg'
)

# ---------------------------------------------------------------------------
# Plain-text helpers — NO tput: this script runs inside an App window
# ---------------------------------------------------------------------------
banner() { echo " = = = = = = = = = = = = = = = = = = = = = = = = = ="; }
fail()   { echo "Error: $1" >&2; exit 1; }

# ---------------------------------------------------------------------------
# Pre-flight: everything the script needs must exist BEFORE we start.
# NOTE: ./Ventura/V8series is NOT listed — the script creates it itself
# with mkdir -p below (same as the original).
# ---------------------------------------------------------------------------
for f in \
    "$SOURCE_SCRIPT" \
    "./EFIFOLDER" \
    "./V-BOX" \
    "./HFS-+" \
    "./8-series-Haswell" \
    "./Ventura/V7series" \
    "./Script/ScriptsESP" \
    "./Script/ScriptsESPVBOX" \
    "./Script/ScriptsESPHFS" \
    "./Script/Scripts8-series-Haswell" \
    "./script/Ventura/7series/Ventura" \
    "./script/Ventura/8series/Ventura" \
    "./Distribution" \
    "./Resources" \
    "./License.rtf" \
    "./applet.icns" \
    "./description.rtfd" \
    "./Assets.car" \
    "./Scripts/main.rtf"; do
    [ -e "$f" ] || fail "required file not found: $f"
done

# The Desktop Packager folder may not exist on a clean machine
mkdir -p "$OUT_APP_DIR"

# ---------------------------------------------------------------------------
# Notifications
# ---------------------------------------------------------------------------
osascript <<'EOD'
  display alert "Create
Install Media HP Laptop OC.app" buttons ("OK") giving up after 2
EOD

banner
echo " Create HP ProBook EliteBook Installer"
banner
sleep 1

# ---------------------------------------------------------------------------
# Clean previous build  (Package-DIR wiped here only, survives at the end)
# ---------------------------------------------------------------------------
rm -rf "$USB_PKG" "$PKG_DIR" "$APP_NAME"
sleep 1
mkdir -p ./Installer ./InstallerHP "$BUILD_STAGE" "$PKG_DIR" ./Ventura/V8series

osascript -e 'display notification "Installer HP-ProBook-USB-Installer" with title "Create" sound name "default"'

# ---------------------------------------------------------------------------
# Build + expand every package
# ---------------------------------------------------------------------------
total=${#PACKAGES[@]}
i=0
for row in "${PACKAGES[@]}"; do
    IFS='|' read -r root scripts ident ver out <<< "$row"
    i=$((i + 1))

    [ -d "$root" ] || fail "package source not found: $root"

    echo "[$i/$total] Building $out"
    pkgbuild --root "$root" --scripts "$scripts" --identifier "$ident" \
        --version "$ver" --install-location /Private/tmp/EFIROOTDIR \
        "$BUILD_STAGE/$out" || fail "pkgbuild failed for $out"
    pkgutil --expand "$BUILD_STAGE/$out" "$PKG_DIR/$out" \
        || fail "pkgutil --expand failed for $out"
done
sleep 2

# ---------------------------------------------------------------------------
# Copy resources and distribution into the flatten source
# ---------------------------------------------------------------------------
cp -Rp ./Distribution "$PKG_DIR" || fail "could not copy Distribution"
cp -Rp ./Resources "$PKG_DIR" || fail "could not copy Resources"

banner
echo " Create the final Packages with pkgutil"
sleep 1

# ---------------------------------------------------------------------------
# Flatten the Packages with pkgutil
# ---------------------------------------------------------------------------
pkgutil --flatten "$PKG_DIR" "$USB_PKG" || fail "pkgutil --flatten failed"
sleep 1
rm -rf ./InstallerHP

# ---------------------------------------------------------------------------
# Create Install Media HP Laptop OC App
# ---------------------------------------------------------------------------
banner
echo " Create Install Media HP Laptop OC App"

/usr/bin/osacompile -o "$APP_NAME" "$SOURCE_SCRIPT" \
    || fail "osacompile failed"

# Use Startup screen and copyright
defaults write "$dir/$APP_NAME/Contents/Info" NSHumanReadableCopyright "Copyright © 2026 chris1111, All Rights Reserved."
defaults write "$dir/$APP_NAME/Contents/Info" CFBundleShortVersionString "1.0"
defaults write "$dir/$APP_NAME/Contents/Info" OSAAppletShowStartupScreen -bool true

# Copy Licenses to the right place
cp -p License.rtf "$APP_NAME/Contents/Resources" || fail "could not copy License.rtf"
# Copy applet.icns to the right place
cp -Rp applet.icns "$APP_NAME/Contents/Resources" || fail "could not copy applet.icns"
# Copy description to the right place
cp -Rp description.rtfd "$APP_NAME/Contents/Resources" || fail "could not copy description.rtfd"
# Copy Installer to the right place
cp -Rp Installer "$APP_NAME/Contents/Resources" || fail "could not copy Installer"
# Copy Assets to the right place
cp -Rp Assets.car "$APP_NAME/Contents/Resources" || fail "could not copy Assets.car"
# Copy main.rtf to the right place
cp -Rp Scripts/main.rtf "$APP_NAME/Contents/Resources/Scripts" || fail "could not copy main.rtf"

sleep 1
mv "$dir/$APP_NAME/Contents/MacOS/applet" \
   "$dir/$APP_NAME/Contents/MacOS/Install Media HP Laptop OC" \
   || fail "could not rename applet binary"
sleep 1
defaults write "$dir/$APP_NAME/Contents/Info" CFBundleExecutable -string "Install Media HP Laptop OC"
sleep 1

# ---------------------------------------------------------------------------
# Zip app (normalizes the applet), then unzip fresh
# ---------------------------------------------------------------------------
sleep 1
zip -r "$APP_NAME.zip" "$APP_NAME" || fail "zip failed"
sleep 1
rm -rf "$APP_NAME"
unzip -o "$APP_NAME.zip" || fail "unzip failed"
sleep 1

# Move app to Desktop packager folder
cp -Rp "$APP_NAME" "$OUT_APP_DIR/$APP_NAME" || fail "could not copy app to Desktop"
sleep 1
rm -rf "$APP_NAME.zip"

echo
sleep 1
rm -rf "$USB_PKG" "$APP_NAME"

banner
echo " Install Media HP Laptop OC.app completed"
banner
sleep 1
banner
echo " Desktop ➤ Install Media HP Laptop OC.app"
echo " Completed Done!"
banner