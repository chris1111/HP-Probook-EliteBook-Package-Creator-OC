#!/bin/bash
#
# Script for Installer HP-ProBook-EliteBook-macOS
# (c) Copyright 2018, 2026 chris1111
# Creates HP-ProBook-EliteBook-macOS.pkg + downloads OCLP into the Packager folder
# Dependencies: pkgbuild, pkgutil, productbuild, ditto
#

set -u

# Always run from the script's own folder
cd "$(dirname "$0")" || exit 1

# ---------------------------------------------------------------------------
# Config — edit here only
# ---------------------------------------------------------------------------
APP_NAME="OpenCore-Patcher.pkg.zip"
OCLP_URL="https://github.com/chris1111/OCLP-Dev-repos/releases/download/2.4.1/OpenCore-Patcher.pkg.zip"

BUILD_DIR="$HOME/Desktop/HP-ProBook-EliteBook-macOS"
PKG_STAGE="$BUILD_DIR/BUILD-PACKAGE"
PACKAGER_DIR="$HOME/Desktop/HP-ProBook-EliteBook-Packager"
EXPAND_DIR="/tmp/PackageDIR"
ID_PREFIX="com.chris1111.hpprobookelitebookmacos"
ICON_DIR="./Build/PackageMaker/Icon"

# ---------------------------------------------------------------------------
# Package table:  root | scripts (empty = none) | identifier suffix | version | install-location | output
# ---------------------------------------------------------------------------
PACKAGES=(
    # --- Patcher / EFI / Kexts ------------------------------------------------
    './Patcher|./script/PRE|Patcher|1|/|Patcher.pkg'
    './EFI-DSDT||EFI-DSDT|1.0|/tmp/EFI-DSDT|efidsdt.pkg'
    './Kexts|./script/KEXTS-8S|kexts|1.0|/Private/tmp/EFIROOTDIR/EFI/OC/Kexts|kexts.pkg'
    # --- 8-series laptops -------------------------------------------------------
    './DSDT-Patch/8series-laptop/3x0-G1|./script/CONFIG-8S/3x0-G1|3x0-G1|1.0|/tmp/EFI-DSDT|3x0-G1.pkg'
    './DSDT-Patch/8series-laptop/4x0-G1HD4400|./script/CONFIG-8S/4x0-G1HD4400|4x0-G1HD4400|1.0|/tmp/EFI-DSDT|4x0-G1HD4400.pkg'
    './DSDT-Patch/8series-laptop/4x0-G1HD4600|./script/CONFIG-8S/4x0-G1HD4600|4x0-G1HD4600|1.0|/tmp/EFI-DSDT|4x0-G1HD4600.pkg'
    './DSDT-Patch/8series-laptop/4x0-G2|./script/CONFIG-8S/4x0-G2|4x0-G2|1.0|/tmp/EFI-DSDT|4x0-G2.pkg'
    './DSDT-Patch/8series-laptop/6x0-G1|./script/CONFIG-8S/6x0-G1|6x0-G1|1.0|/tmp/EFI-DSDT|6x0-G1.pkg'
    './DSDT-Patch/8series-laptop/8x0-G1|./script/CONFIG-8S/8x0-G1|8x0-G1|1.0|/tmp/EFI-DSDT|8x0-G1.pkg'
    './DSDT-Patch/8series-laptop/ZBook-G1|./script/CONFIG-8S/ZBook-G1|ZBook-G1|1.0|/tmp/EFI-DSDT|ZBook-G1.pkg'
    './DSDT-Patch/8series-laptop/Folio1040-G1|./script/CONFIG-8S/Folio1040-G1|Folio1040-G1|1.0|/tmp/EFI-DSDT|Folio1040-G1.pkg'
    # --- 7-series laptops -------------------------------------------------------
    './DSDT-Patch/7series laptop HP Probook/4x0 G0||4x0G0|1.0|/tmp/EFI-DSDT|4x0G0.pkg'
    './DSDT-Patch/7series laptop HP Probook/4x40||4x40|1.0|/tmp/EFI-DSDT|4x40.pkg'
    './DSDT-Patch/7series laptop HP Probook/6x70b||6x70b|1.0|/tmp/EFI-DSDT|6x70b.pkg'
    './DSDT-Patch/7series laptop HP Probook/Elitebook 2x70p||Elitebook2x70p|1.0|/tmp/EFI-DSDT|elitebook2X70P.pkg'
    './DSDT-Patch/7series laptop HP Probook/Elitebook 8x70p||Elitebook8x70p|1.0|/tmp/EFI-DSDT|elitebook8X70P.pkg'
    './DSDT-Patch/7series laptop HP Probook/Elitebook 9x70m||Elitebook9x70m|1.0|/tmp/EFI-DSDT|elitebook9X70M.pkg'
    './DSDT-Patch/7series laptop HP Probook/6x70B_AMD||6x70B_AMD|1.0|/tmp/EFI-DSDT|6x70bamd.pkg'
    './DSDT-Patch/7series laptop HP Probook/6x70B_NVIDIA||6x70B_NVIDIA|1.0|/tmp/EFI-DSDT|6x70bnvidia.pkg'
    # --- Graphics / HDMI --------------------------------------------------------
    './DSDT-Patch/Intel HD 3k 4k Low High/HD4000Low||HD4000Low|1.0|/tmp/EFI-DSDT|hd4000low.pkg'
    './DSDT-Patch/Intel HD 3k 4k Low High/HD4000High|./script/HD4000High|HD4000High|1.0|/tmp/EFI-DSDT|hd4000high.pkg'
    './DSDT-Patch/HDMI/HDMILow||HDMILow|1.0|/tmp/EFI-DSDT|hdmilow.pkg'
    './DSDT-Patch/HDMI/1080p+HDMI||1080p+HDMI|1.0|/tmp/EFI-DSDT|1080phdmi.pkg'
    # --- Fan patches ------------------------------------------------------------
    './DSDT-Patch/Fan/FanQuiet||FanQuiet|1.0|/tmp/EFI-DSDT|fanquiet.pkg'
    './DSDT-Patch/Fan/FanQuietMod||FanQuietMod|1.0|/tmp/EFI-DSDT|fanquietmod.pkg'
    './DSDT-Patch/Fan/FanSmooth||FanSmooth|1.0|/tmp/EFI-DSDT|fansmooth.pkg'
    './DSDT-Patch/Fan/FanPatch||FanPatch|1.0|/tmp/EFI-DSDT|fanpatch.pkg'
    './DSDT-Patch/Fan/FanSpeed||FanSpeed|1.0|/tmp/EFI-DSDT|fanspeed.pkg'
    # --- Core components --------------------------------------------------------
    './OpenCore||OpenCore|1.0|/|opencore.pkg'
    './Install ESP/EFIFOLDERMAIN|./script/Script UEFI/efifolder|EFIFOLDERMAIN|1.0|/Private/tmp|efifoldermain.pkg'
    './AirportBrcmFixup|./script/Airport|AirportBrcmFixup|1.0|/Private/tmp|airportbrcmfixup.pkg'
    './DSDT-Patch/BCM94352HMB||bcm94352hmb|1.0|/tmp/EFI-DSDT|BCM94352HMB.pkg'
    './DSDT-Patch/BCM943224HMS||bcm943224hms|1.0|/tmp/EFI-DSDT|BCM943224HMS.pkg'
    './DSDT-Patch/BCM94360HMB||bcm94360hmb|1.0|/tmp/EFI-DSDT|BCM94360HMB.pkg'
    './Bluetooth/Monterey|./script/BluetoothMonterey|BluetoothMonterey|1.0|/Private/tmp|bluetoothMonterey.pkg'
    './HWMonitor||HWMonitor|1.0|/Applications|hwmonitor.pkg'
    './APP|./script/App|App|1.0|/Private/tmp|app.pkg'
    './VBOX|./script/VBOX|VBOX|1.0|/Private/tmp|VBOX.pkg'
    './HFSPLUS|./script/HFS|HFSPLUS|1.0|/Private/tmp|HFSPLUS.pkg'
    './POST|./script/POST|POST|1.0|/|post.pkg'
    './PatchHD4000|./script/PatchHD4000|PatchHD4000|1.0|/Private/tmp|PatchHD4000.pkg'
    # --- Ventura ------------------------------------------------------------------
    './Ventura||Ventura|1.0|/Private/tmp|Ventura.pkg'
    './Ventura/V7series|./script/Ventura/7series/Ventura|V7series|1.0|/Private/tmp|V7series.pkg'
    './Ventura/V8series|./script/Ventura/8series/Ventura|V8series|1.0|/Private/tmp|V8series.pkg'
)

# ---------------------------------------------------------------------------
# Plain-text helpers — NO tput: this script runs inside an App window
# where $TERM is unset. Functions kept so call sites stay identical.
# ---------------------------------------------------------------------------
good()   { printf '%s\n' "$1"; }
accent() { printf '%s\n' "$1"; }

banner() { echo; echo " = = = = = = = = = = = = = = = = = = = = = = = = = ="; }

fail() { echo "Error: $1" >&2; exit 1; }

# ---------------------------------------------------------------------------
# Pre-flight: everything the script needs must exist BEFORE we start
# ---------------------------------------------------------------------------
for f in \
    "$ICON_DIR/seticon" \
    "$ICON_DIR/Icon.icns" \
    "$ICON_DIR/Support.icns" \
    "$ICON_DIR/FileVaultIcon.icns" \
    "./Resources/Distribution.zip" \
    "./Resources/Resources.zip" \
    "./GateKeeper.command" \
    "./Support Donate.html"; do
    [ -e "$f" ] || fail "required file not found: $f"
done
[ -x "$ICON_DIR/seticon" ] || fail "$ICON_DIR/seticon is not executable"

# ---------------------------------------------------------------------------
# Notifications
# ---------------------------------------------------------------------------
osascript -e 'display notification "Installer HP-ProBook-EliteBook-macOS" with title "Create" sound name "default"'
osascript <<'EOD'
  display alert "Create
HP-ProBook-EliteBook-macOS.pkg" buttons ("OK") giving up after 2
EOD

# ---------------------------------------------------------------------------
# Clean previous build  (PackageDIR wiped here only, like the original)
# ---------------------------------------------------------------------------
echo "Cleaning previous build..."
rm -f ./PRE/.gitkeep ./OpenCore/.gitkeep ./POST/.gitkeep ./Patcher/.gitkeep
rm -rf "$BUILD_DIR" "$BUILD_DIR.pkg" "$EXPAND_DIR"
sleep 1
mkdir -p "$PKG_STAGE" "$EXPAND_DIR" "$PACKAGER_DIR" \
         ./Ventura/V8series ./PRE ./OpenCore ./POST ./Patcher

# ---------------------------------------------------------------------------
# Build + expand every package
# ---------------------------------------------------------------------------
total=${#PACKAGES[@]}
i=0
for row in "${PACKAGES[@]}"; do
    IFS='|' read -r root scripts suffix ver loc out <<< "$row"
    i=$((i + 1))
    ident="$ID_PREFIX.$suffix.pkg"

    [ -d "$root" ] || fail "package source not found: $root"

    printf '%s\n' "[$i/$total] Building $out"
    if [ -n "$scripts" ]; then
        pkgbuild --root "$root" --scripts "$scripts" --identifier "$ident" \
            --version "$ver" --install-location "$loc" "$PKG_STAGE/$out" \
            || fail "pkgbuild failed for $out"
    else
        pkgbuild --root "$root" --identifier "$ident" \
            --version "$ver" --install-location "$loc" "$PKG_STAGE/$out" \
            || fail "pkgbuild failed for $out"
    fi
    pkgutil --expand "$PKG_STAGE/$out" "$EXPAND_DIR/$out" \
        || fail "pkgutil --expand failed for $out"
done
sleep 2

# ---------------------------------------------------------------------------
# Extract Distribution and Resources
# ---------------------------------------------------------------------------
echo
echo "Extracting Distribution and Resources..."
ditto -x -k --sequesterRsrc --rsrc ./Resources/Distribution.zip "$PKG_STAGE" \
    || fail "could not extract Distribution.zip"
mv "$PKG_STAGE/Distribution" "$PKG_STAGE/Distribution.xml" \
    || fail "could not rename Distribution to Distribution.xml"
ditto -x -k --sequesterRsrc --rsrc ./Resources/Resources.zip "$PKG_STAGE" \
    || fail "could not extract Resources.zip"

# ---------------------------------------------------------------------------
# Final package with productbuild
# ---------------------------------------------------------------------------
banner
echo " Create the final Packages with Productbuild"
sleep 3
productbuild \
    --distribution "$PKG_STAGE/Distribution.xml" \
    --package-path "$PKG_STAGE/" \
    --resources "$PKG_STAGE/Resources" \
    "$PACKAGER_DIR/HP-ProBook-EliteBook-macOS.pkg" \
    || fail "productbuild failed"
sleep 2

# ---------------------------------------------------------------------------
# Packager folder: GateKeeper, Support page, icons
# ---------------------------------------------------------------------------
cp -p ./GateKeeper.command "$PACKAGER_DIR/GateKeeper.command" \
    || fail "could not copy GateKeeper.command"
chmod 755 "$PACKAGER_DIR/GateKeeper.command"
cp -Rp "./Support Donate.html" "$PACKAGER_DIR" \
    || fail "could not copy Support Donate.html"

"$ICON_DIR/seticon" -d "$ICON_DIR/Icon.icns" "$PACKAGER_DIR/HP-ProBook-EliteBook-macOS.pkg" \
    || fail "could not set package icon"
sleep 1
"$ICON_DIR/seticon" -d "$ICON_DIR/Support.icns" "$PACKAGER_DIR/Support Donate.html" \
    || fail "could not set Support icon"
"$ICON_DIR/seticon" -d "$ICON_DIR/FileVaultIcon.icns" "$PACKAGER_DIR/GateKeeper.command" \
    || fail "could not set GateKeeper icon"

# ---------------------------------------------------------------------------
# Download OCLP
# ---------------------------------------------------------------------------
osascript -e 'display notification "OCLP support Ventura Intel HD 4X 6X" with title "Download" sound name "default"'
osascript <<'EOD'
  display alert "Download OCLP
Wait . . ." buttons ("OK") giving up after 2
EOD

banner
echo " Download OCLP support Sequoia 15 Sonoma 14 Ventura 13 Intel HD 4X 6X"
echo " Support Wifi BCM43xx"
curl -fL "$OCLP_URL" -o "$PACKAGER_DIR/$APP_NAME" \
    || fail "could not download OCLP!"

(
    cd "$PACKAGER_DIR" || exit 1
    unzip -o "$APP_NAME" || fail "unzip failed!"
    sleep 1
    rm -f "$APP_NAME"
    rm -rf __MACOSX
)

banner
echo " Done!"
banner
echo