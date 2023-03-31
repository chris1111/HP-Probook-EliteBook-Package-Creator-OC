#!/bin/bash
# script for Installer HP-ProBook-EliteBook-macOS
# (c) Copyright 2018, 2021 chris1111
PARENTDIR=$(dirname "$0")
cd "$PARENTDIR"
# VARS
APP_NAME="OpenCore-Patcher-GUI.app.zip"

# shell script Notifications
osascript -e 'display notification "Installer HP-ProBook-EliteBook-macOS" with title "Create"  sound name "default"'

rm -rf ./PRE/.gitkeep
rm -rf ./OpenCore/.gitkeep
rm -rf ./POST/.gitkeep
rm -rf ./Patcher/.gitkeep
rm -rf /$HOME/Desktop/HP-ProBook-EliteBook-macOS
rm -rf /$HOME/Desktop/HP-ProBook-EliteBook-macOS.pkg
rm -rf /tmp/PackageDIR
Sleep 1
mkdir -p /$HOME/Desktop/HP-ProBook-EliteBook-macOS
mkdir -p /$HOME/Desktop/HP-ProBook-EliteBook-macOS/BUILD-PACKAGE
mkdir -p /tmp/PackageDIR


# Create the Packages with pkgbuild
pkgbuild --root ./Patcher --scripts ./script/PRE --identifier com.chris1111.hpprobookelitebookmacos.Patcher.pkg --version 1 --install-location / /$HOME/Desktop/HP-ProBook-EliteBook-macOS/BUILD-PACKAGE/Patcher.pkg

pkgbuild --root ./EFI-DSDT --identifier com.chris1111.hpprobookelitebookmacos.EFI-DSDT.pkg --version 1.0 --install-location /tmp/EFI-DSDT /$HOME/Desktop/HP-ProBook-EliteBook-macOS/BUILD-PACKAGE/efidsdt.pkg

pkgbuild --root ./Kexts --scripts ./script/KEXTS-8S --identifier com.chris1111.hpprobookelitebookmacos.kexts.pkg --version 1.0 --install-location /Private/tmp/EFIROOTDIR/EFI/OC/Kexts /$HOME/Desktop/HP-ProBook-EliteBook-macOS/BUILD-PACKAGE/kexts.pkg

pkgbuild --root ./DSDT-Patch/8series-laptop/3x0-G1 --scripts ./script/CONFIG-8S/3x0-G1 --identifier com.chris1111.hpprobookelitebookmacos.3x0-G1.pkg --version 1.0 --install-location /tmp/EFI-DSDT /$HOME/Desktop/HP-ProBook-EliteBook-macOS/BUILD-PACKAGE/3x0-G1.pkg

pkgbuild --root ./DSDT-Patch/8series-laptop/4x0-G1 --scripts ./script/CONFIG-8S/4x0-G1 --identifier com.chris1111.hpprobookelitebookmacos.4x0-G1.pkg --version 1.0 --install-location /tmp/EFI-DSDT /$HOME/Desktop/HP-ProBook-EliteBook-macOS/BUILD-PACKAGE/4x0-G1.pkg

pkgbuild --root ./DSDT-Patch/8series-laptop/4x0-G2 --scripts ./script/CONFIG-8S/4x0-G2 --identifier com.chris1111.hpprobookelitebookmacos.4x0-G2.pkg --version 1.0 --install-location /tmp/EFI-DSDT /$HOME/Desktop/HP-ProBook-EliteBook-macOS/BUILD-PACKAGE/4x0-G2.pkg

pkgbuild --root ./DSDT-Patch/8series-laptop/6x0-G1 --scripts ./script/CONFIG-8S/6x0-G1 --identifier com.chris1111.hpprobookelitebookmacos.6x0-G1.pkg --version 1.0 --install-location /tmp/EFI-DSDT /$HOME/Desktop/HP-ProBook-EliteBook-macOS/BUILD-PACKAGE/6x0-G1.pkg

pkgbuild --root ./DSDT-Patch/8series-laptop/8x0-G1 --scripts ./script/CONFIG-8S/8x0-G1 --identifier com.chris1111.hpprobookelitebookmacos.8x0-G1.pkg --version 1.0 --install-location /tmp/EFI-DSDT /$HOME/Desktop/HP-ProBook-EliteBook-macOS/BUILD-PACKAGE/8x0-G1.pkg

pkgbuild --root ./DSDT-Patch/8series-laptop/ZBook-G1 --scripts ./script/CONFIG-8S/ZBook-G1 --identifier com.chris1111.hpprobookelitebookmacos.ZBook-G1.pkg --version 1.0 --install-location /tmp/EFI-DSDT /$HOME/Desktop/HP-ProBook-EliteBook-macOS/BUILD-PACKAGE/ZBook-G1.pkg

pkgbuild --root ./DSDT-Patch/8series-laptop/Folio1040-G1 --scripts ./script/CONFIG-8S/Folio1040-G1 --identifier com.chris1111.hpprobookelitebookmacos.Folio1040-G1.pkg --version 1.0 --install-location /tmp/EFI-DSDT /$HOME/Desktop/HP-ProBook-EliteBook-macOS/BUILD-PACKAGE/Folio1040-G1.pkg

pkgbuild --root ./DSDT-Patch/"7series laptop HP Probook"/"4x0 G0" --identifier com.chris1111.hpprobookelitebookmacos.4x0G0.pkg --version 1.0 --install-location /tmp/EFI-DSDT /$HOME/Desktop/HP-ProBook-EliteBook-macOS/BUILD-PACKAGE/4x0G0.pkg

pkgbuild --root ./DSDT-Patch/"7series laptop HP Probook"/4x40 --identifier com.chris1111.hpprobookelitebookmacos.4x40.pkg --version 1.0 --install-location /tmp/EFI-DSDT /$HOME/Desktop/HP-ProBook-EliteBook-macOS/BUILD-PACKAGE/4x40.pkg

pkgbuild --root ./DSDT-Patch/"7series laptop HP Probook"/6x70b --identifier com.chris1111.hpprobookelitebookmacos.6x70b.pkg --version 1.0 --install-location /tmp/EFI-DSDT /$HOME/Desktop/HP-ProBook-EliteBook-macOS/BUILD-PACKAGE/6x70b.pkg

pkgbuild --root ./DSDT-Patch/"7series laptop HP Probook"/"Elitebook 2x70p" --identifier com.chris1111.hpprobookelitebookmacos.Elitebook2x70p.pkg --version 1.0 --install-location /tmp/EFI-DSDT /$HOME/Desktop/HP-ProBook-EliteBook-macOS/BUILD-PACKAGE/elitebook2X70P.pkg

pkgbuild --root ./DSDT-Patch/"7series laptop HP Probook"/"Elitebook 8x70p" --identifier com.chris1111.hpprobookelitebookmacos.Elitebook8x70p.pkg --version 1.0 --install-location /tmp/EFI-DSDT /$HOME/Desktop/HP-ProBook-EliteBook-macOS/BUILD-PACKAGE/elitebook8X70P.pkg

pkgbuild --root ./DSDT-Patch/"7series laptop HP Probook"/"Elitebook 9x70m" --identifier com.chris1111.hpprobookelitebookmacos.Elitebook9x70m.pkg --version 1.0 --install-location /tmp/EFI-DSDT /$HOME/Desktop/HP-ProBook-EliteBook-macOS/BUILD-PACKAGE/elitebook9X70M.pkg

pkgbuild --root ./DSDT-Patch/"7series laptop HP Probook"/6x70B_AMD --identifier com.chris1111.hpprobookelitebookmacos.6x70B_AMD.pkg --version 1.0 --install-location /tmp/EFI-DSDT /$HOME/Desktop/HP-ProBook-EliteBook-macOS/BUILD-PACKAGE/6x70bamd.pkg

pkgbuild --root ./DSDT-Patch/"7series laptop HP Probook"/6x70B_NVIDIA --identifier com.chris1111.hpprobookelitebookmacos.6x70B_NVIDIA.pkg --version 1.0 --install-location /tmp/EFI-DSDT /$HOME/Desktop/HP-ProBook-EliteBook-macOS/BUILD-PACKAGE/6x70bnvidia.pkg

pkgbuild --root ./DSDT-Patch/"Intel HD 3k 4k Low High"/HD4000Low --identifier com.chris1111.hpprobookelitebookmacos.HD4000Low.pkg --version 1.0 --install-location /tmp/EFI-DSDT /$HOME/Desktop/HP-ProBook-EliteBook-macOS/BUILD-PACKAGE/hd4000low.pkg

pkgbuild --root ./DSDT-Patch/"Intel HD 3k 4k Low High"/HD4000High --scripts ./script/HD4000High --identifier com.chris1111.hpprobookelitebookmacos.HD4000High.pkg --version 1.0 --install-location /tmp/EFI-DSDT /$HOME/Desktop/HP-ProBook-EliteBook-macOS/BUILD-PACKAGE/hd4000high.pkg

pkgbuild --root ./DSDT-Patch/HDMI/HDMILow --identifier com.chris1111.hpprobookelitebookmacos.HDMILow.pkg --version 1.0 --install-location /tmp/EFI-DSDT /$HOME/Desktop/HP-ProBook-EliteBook-macOS/BUILD-PACKAGE/hdmilow.pkg

pkgbuild --root ./DSDT-Patch/HDMI/1080p+HDMI --identifier com.chris1111.hpprobookelitebookmacos.1080p+HDMI.pkg --version 1.0 --install-location /tmp/EFI-DSDT /$HOME/Desktop/HP-ProBook-EliteBook-macOS/BUILD-PACKAGE/1080phdmi.pkg


pkgbuild --root ./DSDT-Patch/Fan/FanQuiet --identifier com.chris1111.hpprobookelitebookmacos.FanQuiet.pkg --version 1.0 --install-location /tmp/EFI-DSDT /$HOME/Desktop/HP-ProBook-EliteBook-macOS/BUILD-PACKAGE/fanquiet.pkg

pkgbuild --root ./DSDT-Patch/Fan/FanQuietMod --identifier com.chris1111.hpprobookelitebookmacos.FanQuietMod.pkg --version 1.0 --install-location /tmp/EFI-DSDT /$HOME/Desktop/HP-ProBook-EliteBook-macOS/BUILD-PACKAGE/fanquietmod.pkg

pkgbuild --root ./DSDT-Patch/Fan/FanSmooth --identifier com.chris1111.hpprobookelitebookmacos.FanSmooth.pkg --version 1.0 --install-location /tmp/EFI-DSDT /$HOME/Desktop/HP-ProBook-EliteBook-macOS/BUILD-PACKAGE/fansmooth.pkg

pkgbuild --root ./DSDT-Patch/Fan/FanPatch --identifier com.chris1111.hpprobookelitebookmacos.FanPatch.pkg --version 1.0 --install-location /tmp/EFI-DSDT /$HOME/Desktop/HP-ProBook-EliteBook-macOS/BUILD-PACKAGE/fanpatch.pkg

pkgbuild --root ./DSDT-Patch/Fan/FanSpeed --identifier com.chris1111.hpprobookelitebookmacos.FanSpeed.pkg --version 1.0 --install-location /tmp/EFI-DSDT /$HOME/Desktop/HP-ProBook-EliteBook-macOS/BUILD-PACKAGE/fanspeed.pkg

pkgbuild --root ./OpenCore --identifier com.chris1111.hpprobookelitebookmacos.OpenCore.pkg --version 1.0 --install-location / /$HOME/Desktop/HP-ProBook-EliteBook-macOS/BUILD-PACKAGE/opencore.pkg

pkgbuild --root ./"Install ESP"/EFIFOLDERMAIN --scripts ./script/"Script UEFI"/"efifolder" --identifier com.chris1111.hpprobookelitebookmacos.EFIFOLDERMAIN.pkg --version 1.0 --install-location /Private/tmp /$HOME/Desktop/HP-ProBook-EliteBook-macOS/BUILD-PACKAGE/efifoldermain.pkg

pkgbuild --root ./AirportBrcmFixup --scripts ./script/Airport --identifier com.chris1111.hpprobookelitebookmacos.AirportBrcmFixup.pkg --version 1.0 --install-location /Private/tmp /$HOME/Desktop/HP-ProBook-EliteBook-macOS/BUILD-PACKAGE/airportbrcmfixup.pkg

pkgbuild --root ./DSDT-Patch/BCM4322x --identifier com.chris1111.hpprobookelitebookmacos.patchbcmdsdt.pkg --version 1.0 --install-location /tmp/EFI-DSDT /$HOME/Desktop/HP-ProBook-EliteBook-macOS/BUILD-PACKAGE/patchbcmdsdt.pkg

pkgbuild --root ./Bluetooth/Catalina --scripts ./script/BluetoothCatalina --identifier com.chris1111.hpprobookelitebookmacos.BluetoothCatalina.pkg --version 1.0 --install-location /Private/tmp /$HOME/Desktop/HP-ProBook-EliteBook-macOS/BUILD-PACKAGE/bluetoothCatalina.pkg

pkgbuild --root ./Bluetooth/BigSur --scripts ./script/BluetoothBigSur --identifier com.chris1111.hpprobookelitebookmacos.BluetoothBigSur.pkg --version 1.0 --install-location /Private/tmp /$HOME/Desktop/HP-ProBook-EliteBook-macOS/BUILD-PACKAGE/bluetoothBigSur.pkg

pkgbuild --root ./Bluetooth/Monterey --scripts ./script/BluetoothMonterey --identifier com.chris1111.hpprobookelitebookmacos.BluetoothMonterey.pkg --version 1.0 --install-location /Private/tmp /$HOME/Desktop/HP-ProBook-EliteBook-macOS/BUILD-PACKAGE/bluetoothMonterey.pkg

pkgbuild --root ./HWMonitor --identifier com.chris1111.hpprobookelitebookmacos.HWMonitor.pkg --version 1.0 --install-location /Applications /$HOME/Desktop/HP-ProBook-EliteBook-macOS/BUILD-PACKAGE/hwmonitor.pkg

pkgbuild --root ./APP --scripts ./script/App --identifier com.chris1111.hpprobookelitebookmacos.App.pkg --version 1.0 --install-location /Private/tmp /$HOME/Desktop/HP-ProBook-EliteBook-macOS/BUILD-PACKAGE/app.pkg

pkgbuild --root ./VBOX --scripts ./script/VBOX --identifier com.chris1111.hpprobookelitebookmacos.VBOX.pkg --version 1.0 --install-location /Private/tmp /$HOME/Desktop/HP-ProBook-EliteBook-macOS/BUILD-PACKAGE/VBOX.pkg

pkgbuild --root ./HFSPLUS --scripts ./script/HFS --identifier com.chris1111.hpprobookelitebookmacos.HFSPLUS.pkg --version 1.0 --install-location /Private/tmp /$HOME/Desktop/HP-ProBook-EliteBook-macOS/BUILD-PACKAGE/HFSPLUS.pkg

pkgbuild --root ./POST --scripts ./script/POST --identifier com.chris1111.hpprobookelitebookmacos.POST.pkg --version 1.0 --install-location / /$HOME/Desktop/HP-ProBook-EliteBook-macOS/BUILD-PACKAGE/post.pkg

pkgbuild --root ./PatchHD4000 --scripts ./script/PatchHD4000 --identifier com.chris1111.hpprobookelitebookmacos.PatchHD4000.pkg --version 1.0 --install-location /Private/tmp /$HOME/Desktop/HP-ProBook-EliteBook-macOS/BUILD-PACKAGE/PatchHD4000.pkg

pkgbuild --root ./Ventura --identifier com.chris1111.hpprobookelitebookmacos.Ventura.pkg --version 1.0 --install-location /Private/tmp /$HOME/Desktop/HP-ProBook-EliteBook-macOS/BUILD-PACKAGE/Ventura.pkg

pkgbuild --root ./Ventura/V7series --scripts ./script/Ventura/7series/Ventura --identifier com.chris1111.hpprobookelitebookmacos.V7series.pkg --version 1.0 --install-location /Private/tmp /$HOME/Desktop/HP-ProBook-EliteBook-macOS/BUILD-PACKAGE/V7series.pkg

pkgbuild --root ./Ventura/V8series --scripts ./script/Ventura/8series/Ventura --identifier com.chris1111.hpprobookelitebookmacos.V8series.pkg --version 1.0 --install-location /Private/tmp /$HOME/Desktop/HP-ProBook-EliteBook-macOS/BUILD-PACKAGE/V8series.pkg


Sleep 2
# Expend the Packages with pkgutil
pkgutil --expand /$HOME/Desktop/HP-ProBook-EliteBook-macOS/BUILD-PACKAGE/efidsdt.pkg /tmp/PackageDIR/efidsdt.pkg

pkgutil --expand /$HOME/Desktop/HP-ProBook-EliteBook-macOS/BUILD-PACKAGE/patcher.pkg /tmp/PackageDIR/patcher.pkg

pkgutil --expand /$HOME/Desktop/HP-ProBook-EliteBook-macOS/BUILD-PACKAGE/kexts.pkg /tmp/PackageDIR/kexts.pkg

pkgutil --expand /$HOME/Desktop/HP-ProBook-EliteBook-macOS/BUILD-PACKAGE/3x0-G1.pkg /tmp/PackageDIR/3x0-G1.pkg

pkgutil --expand /$HOME/Desktop/HP-ProBook-EliteBook-macOS/BUILD-PACKAGE/4x0-G1.pkg /tmp/PackageDIR/4x0-G1.pkg

pkgutil --expand /$HOME/Desktop/HP-ProBook-EliteBook-macOS/BUILD-PACKAGE/4x0-G2.pkg /tmp/PackageDIR/4x0-G2.pkg

pkgutil --expand /$HOME/Desktop/HP-ProBook-EliteBook-macOS/BUILD-PACKAGE/6x0-G1.pkg /tmp/PackageDIR/6x0-G1.pkg

pkgutil --expand /$HOME/Desktop/HP-ProBook-EliteBook-macOS/BUILD-PACKAGE/8x0-G1.pkg /tmp/PackageDIR/8x0-G1.pkg

pkgutil --expand /$HOME/Desktop/HP-ProBook-EliteBook-macOS/BUILD-PACKAGE/ZBook-G1.pkg /tmp/PackageDIR/ZBook-G1.pkg

pkgutil --expand /$HOME/Desktop/HP-ProBook-EliteBook-macOS/BUILD-PACKAGE/Folio1040-G1.pkg /tmp/PackageDIR/Folio1040-G1.pkg

pkgutil --expand /$HOME/Desktop/HP-ProBook-EliteBook-macOS/BUILD-PACKAGE/4x0G0.pkg /tmp/PackageDIR/4x0G0.pkg

pkgutil --expand /$HOME/Desktop/HP-ProBook-EliteBook-macOS/BUILD-PACKAGE/4x40.pkg /tmp/PackageDIR/4x40.pkg

pkgutil --expand /$HOME/Desktop/HP-ProBook-EliteBook-macOS/BUILD-PACKAGE/6x70b.pkg /tmp/PackageDIR/6x70b.pkg

pkgutil --expand /$HOME/Desktop/HP-ProBook-EliteBook-macOS/BUILD-PACKAGE/elitebook2X70P.pkg /tmp/PackageDIR/elitebook2X70P.pkg

pkgutil --expand /$HOME/Desktop/HP-ProBook-EliteBook-macOS/BUILD-PACKAGE/Elitebook8x70p.pkg /tmp/PackageDIR/Elitebook8x70p.pkg

pkgutil --expand /$HOME/Desktop/HP-ProBook-EliteBook-macOS/BUILD-PACKAGE/Elitebook9x70m.pkg  /tmp/PackageDIR/Elitebook9x70m.pkg

pkgutil --expand /$HOME/Desktop/HP-ProBook-EliteBook-macOS/BUILD-PACKAGE/6x70bamd.pkg /tmp/PackageDIR/6x70bamd.pkg

pkgutil --expand /$HOME/Desktop/HP-ProBook-EliteBook-macOS/BUILD-PACKAGE/6x70bnvidia.pkg /tmp/PackageDIR/6x70bnvidia.pkg

pkgutil --expand /$HOME/Desktop/HP-ProBook-EliteBook-macOS/BUILD-PACKAGE/HD4000High.pkg /tmp/PackageDIR/hd4000high.pkg

pkgutil --expand /$HOME/Desktop/HP-ProBook-EliteBook-macOS/BUILD-PACKAGE/HD4000Low.pkg /tmp/PackageDIR/hd4000low.pkg

pkgutil --expand /$HOME/Desktop/HP-ProBook-EliteBook-macOS/BUILD-PACKAGE/HDMILow.pkg /tmp/PackageDIR/hdmilow.pkg

pkgutil --expand /$HOME/Desktop/HP-ProBook-EliteBook-macOS/BUILD-PACKAGE/1080phdmi.pkg /tmp/PackageDIR/1080phdmi.pkg

pkgutil --expand /$HOME/Desktop/HP-ProBook-EliteBook-macOS/BUILD-PACKAGE/fanpatch.pkg /tmp/PackageDIR/fanpatch.pkg

pkgutil --expand /$HOME/Desktop/HP-ProBook-EliteBook-macOS/BUILD-PACKAGE/fanquiet.pkg /tmp/PackageDIR/fanquiet.pkg

pkgutil --expand /$HOME/Desktop/HP-ProBook-EliteBook-macOS/BUILD-PACKAGE/fanquietmod.pkg /tmp/PackageDIR/fanquietmod.pkg

pkgutil --expand /$HOME/Desktop/HP-ProBook-EliteBook-macOS/BUILD-PACKAGE/fansmooth.pkg /tmp/PackageDIR/fansmooth.pkg

pkgutil --expand /$HOME/Desktop/HP-ProBook-EliteBook-macOS/BUILD-PACKAGE/fanspeed.pkg /tmp/PackageDIR/fanspeed.pkg

pkgutil --expand /$HOME/Desktop/HP-ProBook-EliteBook-macOS/BUILD-PACKAGE/opencore.pkg /tmp/PackageDIR/opencore.pkg

pkgutil --expand /$HOME/Desktop/HP-ProBook-EliteBook-macOS/BUILD-PACKAGE/efifoldermain.pkg /tmp/PackageDIR/efifoldermain.pkg

pkgutil --expand /$HOME/Desktop/HP-ProBook-EliteBook-macOS/BUILD-PACKAGE/airportbrcmfixup.pkg /tmp/PackageDIR/airportbrcmfixup.pkg

pkgutil --expand /$HOME/Desktop/HP-ProBook-EliteBook-macOS/BUILD-PACKAGE/patchbcmdsdt.pkg /tmp/PackageDIR/patchbcmdsdt.pkg

pkgutil --expand /$HOME/Desktop/HP-ProBook-EliteBook-macOS/BUILD-PACKAGE/app.pkg /tmp/PackageDIR/app.pkg

pkgutil --expand /$HOME/Desktop/HP-ProBook-EliteBook-macOS/BUILD-PACKAGE/bluetoothCatalina.pkg /tmp/PackageDIR/bluetoothCatalina.pkg

pkgutil --expand /$HOME/Desktop/HP-ProBook-EliteBook-macOS/BUILD-PACKAGE/bluetoothBigSur.pkg /tmp/PackageDIR/bluetoothBigSur.pkg

pkgutil --expand /$HOME/Desktop/HP-ProBook-EliteBook-macOS/BUILD-PACKAGE/bluetoothMonterey.pkg /tmp/PackageDIR/bluetoothMonterey.pkg

pkgutil --expand /$HOME/Desktop/HP-ProBook-EliteBook-macOS/BUILD-PACKAGE/hwmonitor.pkg /tmp/PackageDIR/hwmonitor.pkg

pkgutil --expand /$HOME/Desktop/HP-ProBook-EliteBook-macOS/BUILD-PACKAGE/VBOX.pkg /tmp/PackageDIR/VBOX.pkg

pkgutil --expand /$HOME/Desktop/HP-ProBook-EliteBook-macOS/BUILD-PACKAGE/HFSPLUS.pkg /tmp/PackageDIR/HFSPLUS.pkg

pkgutil --expand /$HOME/Desktop/HP-ProBook-EliteBook-macOS/BUILD-PACKAGE/post.pkg /tmp/PackageDIR/post.pkg

pkgutil --expand /$HOME/Desktop/HP-ProBook-EliteBook-macOS/BUILD-PACKAGE/PatchHD4000.pkg /tmp/PackageDIR/PatchHD4000.pkg

pkgutil --expand /$HOME/Desktop/HP-ProBook-EliteBook-macOS/BUILD-PACKAGE/Ventura.pkg /tmp/PackageDIR/Ventura.pkg

pkgutil --expand /$HOME/Desktop/HP-ProBook-EliteBook-macOS/BUILD-PACKAGE/V7series.pkg /tmp/PackageDIR/V7series.pkg

pkgutil --expand /$HOME/Desktop/HP-ProBook-EliteBook-macOS/BUILD-PACKAGE/V8series.pkg /tmp/PackageDIR/V8series.pkg

Sleep 3
# Copy resources and distribution
ditto -x -k --sequesterRsrc --rsrc ./Resources/Distribution.zip /$HOME/Desktop/HP-ProBook-EliteBook-macOS/BUILD-PACKAGE
mv /$HOME/Desktop/HP-ProBook-EliteBook-macOS/BUILD-PACKAGE/Distribution /$HOME/Desktop/HP-ProBook-EliteBook-macOS/BUILD-PACKAGE/Distribution.xml
ditto -x -k --sequesterRsrc --rsrc ./Resources/Resources.zip /$HOME/Desktop/HP-ProBook-EliteBook-macOS/BUILD-PACKAGE

echo "
= = = = = = = = = = = = = = = = = = = = = = = = =
Create the final Packages with Productbuild "
Sleep 3
# Create the final Packages with Productbuild
productbuild --distribution "/$HOME/Desktop/HP-ProBook-EliteBook-macOS/BUILD-PACKAGE/Distribution.xml"  \
--package-path "/$HOME/Desktop/HP-ProBook-EliteBook-macOS/BUILD-PACKAGE/" \
--resources "/$HOME/Desktop/HP-ProBook-EliteBook-macOS/BUILD-PACKAGE/Resources" \
"/$HOME/Desktop/HP-ProBook-EliteBook-Packager/HP-ProBook-EliteBook-macOS.pkg"
Sleep 2
cp -Rp ./Gatekeeper.command /$HOME/Desktop/HP-ProBook-EliteBook-Packager
cp -Rp ./"Support Donate.html" /$HOME/Desktop/HP-ProBook-EliteBook-Packager
# Change package Icon with seticon
./Build/PackageMaker/Icon/seticon -d ./Build/PackageMaker/Icon/Icon.icns /$HOME/Desktop/HP-ProBook-EliteBook-Packager/HP-ProBook-EliteBook-macOS.pkg
Sleep 1
./Build/PackageMaker/Icon/seticon -d ./Build/PackageMaker/Icon/Support.icns /$HOME/Desktop/HP-ProBook-EliteBook-Packager/"Support Donate.html"
./Build/PackageMaker/Icon/seticon -d ./Build/PackageMaker/Icon/FileVaultIcon.icns /$HOME/Desktop/HP-ProBook-EliteBook-Packager/Gatekeeper.command

# shell script Notifications
osascript -e 'display notification "OCLP support Ventura Intel HD 4X 6X
Wait. . ." with title "Download"  sound name "default"'

echo "
= = = = = = = = = = = = = = = = = = = = = = = = =
Download OCLP support Ventura Intel HD 4X 6X "

curl -L https://github.com/dortania/OpenCore-Legacy-Patcher/releases/download/0.6.2/OpenCore-Patcher-GUI.app.zip -o /$HOME/Desktop/HP-ProBook-EliteBook-Packager/"$APP_NAME"

cd /$HOME/Desktop/HP-ProBook-EliteBook-Packager

unzip "$APP_NAME"
Sleep 1
rm -rf "$APP_NAME"

echo "
= = = = = = = = = = = = = = = = = = = = = = = = =
Done! "
