-- Run the Script, Disable-Gatekeeper will be installed then after double click to renew Disable Gatekeeper
-- Disable-Gatekeeper Copyright © 2024 chris1111 , All Rights Reserved

set source to path to me as string
set source to POSIX path of source & "Contents/Resources/Disable-Gatekeeper.mobileconfig"
set source to quoted form of source
delay 1
-- Open Profiles.prefPane
do shell script "open /System/Library/PreferencePanes/Profiles.prefPane " & source & "/"
delay 1
-- Open Profiles.prefPane/Profiles-Settings.extension
do shell script "open x-apple.systempreferences:com.apple.Profiles-Settings.extension"
