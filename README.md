HP-Probook-EliteBook-Package-Creator-OC
![All Probook](https://user-images.githubusercontent.com/6248794/149630159-70386943-75b8-45f6-8c56-0efc83432bf3.png)

Thanks to ➤ [Support Project](https://github.com/chris1111/HP-Probook-EliteBook-Package-Creator-OC/blob/master/Support-HP-Probook-EliteBook-Package-Creator-OC-Project.md)

#### Latest  Update 14 Jan 2022  ☞ OpenCore 0.7.8 ☞ OC Configurator V-2-56.0.0


## List Update: ⬇︎
<details> 
  <summary>View list Update</summary>


- Update 19 Dec 2021  ☞ OpenCore 0.7.7 ☞ OC Configurator V-2-54.1.0

- Update 03 Dec 2021 Add Image View for the Applications

- Update 31 Oct 2021 OpenSource patchHD0000 script

- Update 05 Oct 2021 OpenCore 0.7.5 / Update OpenCore Configurator

- Update 27 Sept 2021 OpenCore 0.7.4

- Update 23 Sept 2021 fix Displayport High Screen 1600x900 Intel HD 4000 

- Update 21 Sept 2021 fix Displayport High Screen 1600x900 Intel HD 4000 

- Update 09 Sept revert MacBook Pro 13.1

- Update 08 Sept 2021 Use MacBook Pro 14.3

- Update 01 Sept 2021 Xcode Build project

- Update 27 August 2021 enable SSDT-IGPU.aml for USB Installer

- Update: 28 July 2021 OC 0.7.2, fix pasword enable, fix nvram reset

- Update: 27 July 2021 add fonction SIP Check for patch HD 4000

- Update: 27 July 2021 update kext HD 4000, add choice menue for Bluethooth

- Update: 27 July 2021 fix initialisition choice HFSPlus and VBOX

- Update: 25 July 2021 fix create Install Media HP Laptop OC.app on Monterey 12

- Update 25 July 2021 Add description Monterey 12, more clean mount EFI

- Update: 25 July 2021 Fix Bluethooth , Fix Install OpenCore USB installer

- Update: 23 July 2021 add Support Bluethooth /Catalina/BigSur/Monterey

- Latest Update: 22 July 2021 add Support macOS Monterey 12 Intel HD 4000

</details>


#### Download Latest Release 27 August 2021 (V1): ➤ [HP-Probook-EliteBook-Package-Creator-OC ](https://github.com/chris1111/HP-Probook-EliteBook-Package-Creator-OC/releases/tag/V1)

#### Any issue without the Log or all relevant information will be deleted. 
- This does not work on a VM

## Credit: 
- Tester: asdesoso, RegieMac, Axon, jeremy 94, djams, Paul, sajtos888
- Old Project Tester: Screenz, mus68, MueKo, 
platinumsteel, doodoo94, jeremy19, arno608rw, Mtkhan13
- RehabMan for all DSDT patch, patchmatic
- kexts inside OpenCore Credit: rehabman, vit9696, Mieze, lvs1974 
- Intel for IASL
- Apple for Pkgbuild
- [OpenCore team for OpenCore](https://github.com/acidanthera/OpenCorePkg)
- HD 4000 Monterey 12 [Base on Jacklude](https://github.com/jacklukem) work
- HD 4000 Monterey 12 [educovas](https://github.com/educovas) EduCovas for fixed google fonts
- HD 4000 Monterey 12 [Dhinak](https://github.com/DhinakG) for found using beta 6 Metal binaries
- HD 4000 Monterey 12 [khronokernel](https://github.com/khronokernel) for fixing google fonts (WebKit)
- [Packager chris1111](https://github.com/chris1111)
- ———————————————————————————————

* What you need

   - Disable the security SIP and Gatekeeper on your Mac
   - Blank USB key 16 gig for Install macOS
   - Install macOS xxx.app (From Mac App Store)
   
### Bios Version:
- Known working bios version is F61, F62, F64 F66 [(F73 ➤ Confirmed 2570p)](https://www.insanelymac.com/forum/topic/344428-pre-release-macos-big-sur/?page=91&tab=comments#comment-2734611) [(F74 ➤ Confirmed 8470p)](https://github.com/chris1111/HP-Probook-EliteBook-Package-Creator-OC/commit/e6eb41e137c220f3f08b4a8776a8f2516a59e133)
Important Try do not take another Bios version! it would not be dramatic but it's the known bios that works very well

### Bios setup:
- Default setup
- Disable LAN/WLAN Switching
- UEFI Hybrid with CSM
- Disable FastBoot
- ———————————————————————————————


### To use this program you will have to boot on a fresh installation with the 
- Create Install Media HP Laptop tools « IMPORTANT » without adding file aml (DSDT.aml), (SSDT.aml) in  /EFI / OC / ACPI. Only with the two files that are present SSDT-IGPU.aml, SSDT-HMF.aml.

- This program only uses OC and kexts injection, there is no kext to modify in the system and no kext will install in macOS system.
### Support Laptop
- [☞ 7 series laptop HP Probook EliteBook * Ivy Bridge * ](https://ark.intel.com/content/www/us/en/ark/products/codename/29902/ivy-bridge.html#@Mobile) . Support macOS Sierra 10.12 to macOS Monterey 12
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

## Card reader Fix for macOS Big Sur 11 only
- Bios setup ☞ Port Option: Uncheck 1394 Port
- SIP security disable

- Reboot to the SSD then Install [JMicron-Card-Reader installer](https://github.com/chris1111/JMicron-Card-Reader) Folowed Guide.pdf
- Before reboot, you have to allow JMicron update extensions
#### View Spoiler ⇩ Card Reader works
<details> 
<summary>View list  </summary>
   
![Screen Shot ](https://user-images.githubusercontent.com/6248794/87852436-f4426980-c8cf-11ea-913f-72c6093eb32a.png)	

</details>
- ———————————————————————————————

#### High Screen (1600x900) Fix Boot USB Installer black screen ➡︎ [Fix Boot USB Installer (1600x900) black screen](https://github.com/chris1111/HP-Probook-EliteBook-Package-Creator-OC/issues/2#issuecomment-679373248)
- ———————————————————————————————


### Package Creator
![Capture 1](https://user-images.githubusercontent.com/6248794/87812623-7da15f80-c82e-11ea-9b7c-72e0194b7d19.png)

### USB Installer
![Capture 2](https://user-images.githubusercontent.com/6248794/87812926-f86a7a80-c82e-11ea-862d-23dfdb1efa7d.png)
![Capture 3](https://user-images.githubusercontent.com/6248794/87812929-f86a7a80-c82e-11ea-8ed8-50558744775c.png)
- OpenCore Bootloader

- Troubleshooting ➤ [High Screen Laptop 1600x900](https://github.com/chris1111/HP-Probook-EliteBook-Package-Creator-OC/issues/2#issuecomment-679373248)

## macOS Big Sur Installation Steps
- 1- Boot on Install macOS Big Sur ➦ (Wait for the last line of verbose mode and your screen will open)
- 2- Boot on macOS Installer (25 minutes Install time)
- 3- Boot on Preboot (Wait 5 + minutes for the last line of verbose mode (Forcing CS_RUNTIME)  and the system will reboot)
- 4- Reboot again on the SSD ➦ (Wait for the last line of verbose mode and your screen will open)
- ———————————————————————————————

### Post Installer- ⬇︎
![Capture 4](https://user-images.githubusercontent.com/6248794/87813175-63b44c80-c82f-11ea-8607-f3ad6b1dd167.png)



### Follow all steps in the Video- ⬇︎
## See new Option menu in the OC Package, HFSPlus or VboxHFS this is not show in video!
![USB](https://user-images.githubusercontent.com/6248794/90392185-67b8d180-e05c-11ea-983b-dc5f463e4f2e.gif)

### Follow Video about SIP macOS Monterey patch HD 4000 ⬇︎
- Make sur SIP is disable: csrutil disable, csrutil authenticated-root disable

https://user-images.githubusercontent.com/6248794/127252279-31cfba80-b9f3-4a90-b3ed-15c5839cf26e.mov


### New Video Download Release V1: 22 July 2021- ⬇︎
[![Modular Image Creation](https://user-images.githubusercontent.com/6248794/87856188-696f6800-c8eb-11ea-898c-396970e38e1b.png)](https://youtu.be/KYJJVEjyZw4)
### Video USB Install 

[![Modular Image Creation](https://user-images.githubusercontent.com/6248794/87856188-696f6800-c8eb-11ea-898c-396970e38e1b.png)](https://youtu.be/42qO8zuUzPE)
## See new Option menu in the Post install Package, HFSPlus or VboxHFS this is not show in video!
![USB](https://user-images.githubusercontent.com/6248794/90356254-df670c00-e01c-11ea-874d-80f30e1a4bff.gif)

### Video Monterey Post Install- ⬇︎

[![Modular Image Creation](https://user-images.githubusercontent.com/6248794/87856188-696f6800-c8eb-11ea-898c-396970e38e1b.png)](https://youtu.be/jQW35JIuZ6k)

### Video Post Install Big Sur- ⬇︎
[![Modular Image Creation](https://user-images.githubusercontent.com/6248794/87856188-696f6800-c8eb-11ea-898c-396970e38e1b.png)](https://youtu.be/cCdffBkRWrM)

### Video Build with Xcode - ⬇︎
[![Modular Image Creation](https://user-images.githubusercontent.com/6248794/87856188-696f6800-c8eb-11ea-898c-396970e38e1b.png)](https://youtu.be/uStx8EgKa6s)



- Download ➤ [WIFI Speed Test.zip](https://github.com/chris1111/Wireless-USB-Big-Sur-Adapter/files/6895432/WIFI.Speed.Test.zip)

#### Learn How to use ☞ [OpenCore](https://dortania.github.io/OpenCore-Install-Guide/)
