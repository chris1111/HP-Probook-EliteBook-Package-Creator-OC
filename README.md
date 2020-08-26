# HP-Probook-EliteBook-Package-Creator-OC
![Image](https://user-images.githubusercontent.com/6248794/87810976-e0452c00-c82b-11ea-86b6-df352e1e9fa8.png)

### Update: 19 August 2020 Add vsmcgen=1 for usb installer

- Credit Tester: asdesoso, RegieMac, Axon, jeremy 94, 
Paul, sajtos888
- Credit: Old Project Tester: Screenz, mus68, MueKo, 
platinumsteel, doodoo94, jeremy19, arno608rw, Mtkhan13
- Credit: RehabMan for all DSDT patch
- kexts inside OpenCore Credit: rehabman, vit9696, Mieze, lvs1974 
- Credit: Intel for IASL
- Credit: rehabman for patchmatic
- Credit: Apple for Pkgbuild
- Credit: [OpenCore team for OpenCore](https://github.com/acidanthera/OpenCorePkg)
- Credit: [Packager chris1111](https://github.com/chris1111)
- ———————————————————————————————

* What you need

   - Disable the security SIP and Gatekeeper on your Mac
   - Blank USB key 16 gig for Install macOS
   - Install macOS xxx.app (From Mac App Store)
   
### Bios Version:
- Known working bios version is F61, F62, F64 [(F73 ➤ Confirmed 2570p)](https://www.insanelymac.com/forum/topic/344428-pre-release-macos-big-sur/?page=91&tab=comments#comment-2734611)
Important Try do not take another Bios version! it would not be dramatic but it's the known bios that works very well

### Bios setup:
- Default setup
- Disable LAN/WLAN Switching
- UEFI Hybrid with CSM
- Disable FastBoot
- ———————————————————————————————

#### How to use ☞ [OpenCore](https://dortania.github.io/OpenCore-Desktop-Guide/)

### To use this program you will have to boot on a fresh installation with the 
- Create Install Media HP Laptop tools « IMPORTANT » without any file aml (DSDT.aml), (SSDT.aml) in  /EFI / OC / ACPI 

- This program only uses OC and kexts injection, there is no kext to modify in the system and no kext will install in macOS system.
### Support Laptop
- 7 series laptop HP Probook, EliteBook. Support macOS Sierra 10.12 to macOS Big Sur 11
- HP Probook 4x40s, 4x0 G0, 6x70b, 6x70B-AMD, 6x70B-NVIDIA,  Elitebook 8x70p, 2x70p, 9x70m

- ———————————————————————————————
### DSDT PATCH:
- Integrality of the complete system
- Intel HD 4000 Patch (Low screen, High Screen)
- HDMI Patch, (Low screen, High Screen)
- Fan Patch
- ———————————————————————————————
## Recommand WIFI
- Wifi mini PCI Broadcom BCM943224HMS
- Wifi mini PCI AzureWave Broadcom BCM94352HMB

## Card reader Fix
- Bios setup ☞ Port Option: Uncheck 1394 Port
- SIP security disable by booting with installer macOS or in recovery boot, open terminal then type: 
- csrutil disable
- Reboot to the SSD then Install [Kext☞ HSSDBlockStorage.kext, JMB38X.kext](https://drive.google.com/file/d/1nBwUaRkyXYLlJBbbEBP0DPxODYif9k1X/view?usp=sharing) with ☞ [Kext-Droplet-Big Sur](https://github.com/chris1111/Kext-Droplet-Big-Sur)
- Before reboot, you have to allow JMicron on Security allow software
#### View Spoiler ⇩ Card Reader works
<details> 
<summary>View list  </summary>
   
![Screen Shot ](https://user-images.githubusercontent.com/6248794/87852436-f4426980-c8cf-11ea-913f-72c6093eb32a.png)	

</details>
- ———————————————————————————————


### Package Creator
![Capture 1](https://user-images.githubusercontent.com/6248794/87812623-7da15f80-c82e-11ea-9b7c-72e0194b7d19.png)

### USB Installer
![Capture 2](https://user-images.githubusercontent.com/6248794/87812926-f86a7a80-c82e-11ea-862d-23dfdb1efa7d.png)
![Capture 3](https://user-images.githubusercontent.com/6248794/87812929-f86a7a80-c82e-11ea-8ed8-50558744775c.png)
- OpenCore Bootloader

![Capture 5](https://user-images.githubusercontent.com/6248794/87813383-d1607880-c82f-11ea-8fe2-d18cbed8b32d.png)

## macOS Big Sur Installation Steps
- 1- Boot on Install macOS Big Sur ➦ (Wait for the last line of verbose mode and your screen will open)
- 2- Boot on macOS Installer (25 minutes Install time)
- 3- Boot on Preboot (Wait 5 + minutes for the last line of verbose mode (Forcing CS_RUNTIME)  and the system will reboot)
- 4- Reboot again on the SSD ➦ (Wait for the last line of verbose mode and your screen will open)
- ———————————————————————————————

### Post Installer 
![Capture 4](https://user-images.githubusercontent.com/6248794/87813175-63b44c80-c82f-11ea-8607-f3ad6b1dd167.png)


### Follow all steps in the 2 Video ⇩
## See new Option menu in the OC Package, HFSPlus or VboxHFS this is not show in video!
![USB](https://user-images.githubusercontent.com/6248794/90392185-67b8d180-e05c-11ea-983b-dc5f463e4f2e.gif)
### Video USB Install ⇩
[![Modular Image Creation](https://user-images.githubusercontent.com/6248794/87856188-696f6800-c8eb-11ea-898c-396970e38e1b.png)](https://youtu.be/42qO8zuUzPE)
## See new Option menu in the Post install Package, HFSPlus or VboxHFS this is not show in video!
![USB](https://user-images.githubusercontent.com/6248794/90356254-df670c00-e01c-11ea-874d-80f30e1a4bff.gif)
### Video Post Install ⇩
[![Modular Image Creation](https://user-images.githubusercontent.com/6248794/87856188-696f6800-c8eb-11ea-898c-396970e38e1b.png)](https://youtu.be/cCdffBkRWrM)


