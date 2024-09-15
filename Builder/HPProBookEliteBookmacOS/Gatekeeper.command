#!/bin/bash

osascript -e 'tell app "System Events" to display dialog "Disable Gatekeeper
From macOS 10.15 to macOS 15" with icon file "System:Library:CoreServices:CoreTypes.bundle:Contents:Resources:FileVaultIcon.icns" buttons {"Disable"} default button 1 with title "Gatekeeper"'



macOSVersion=$(/usr/bin/sw_vers | grep "ProductVersion" | /usr/bin/awk '{ print $2 }')
echo "Disable GateKeeper"
echo "From macOS $macOSVersion"
if [[ $macOSVersion = 15.* ]]; then    
  printf -- '%s\n' "This Mac is running macOS Sequoia." 
  sudo spctl --global-disable
  echo ""
  echo "GateKeeper Disable"
elif [[ $macOSVersion = 14.* ]]; then 
  printf -- '%s\n' "This Mac is running macOS Sonoma." 
  sudo spctl --master-disable
  echo ""
  echo "GateKeeper Disable"
else
  printf -- '%s\n' "This Mac is running a macOS earlier than Sonoma."
  sudo spctl --master-disable
  echo ""
  echo "GateKeeper Disable"
fi


