# Applescript create by chris1111
# Install Media HP Laptop OC Copyright (c) 2020, 2023 chris1111 All rights reserved.
# Credit: Apple
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
# Version "1.0" by chris1111

set all to paragraphs of (do shell script "ls /Volumes")
set w to choose from list all with prompt " 
To be able to continue, select the volume
that you just formatted.
Then press the OK button" OK button name "OK" with multiple selections allowed
if w is false then
	display dialog "Quit Installer " with icon 0 buttons {"EXIT"} default button {"EXIT"}
	return
end if
try
	
	repeat with teil in w
		do shell script "diskutil `diskutil list | awk '/ " & teil & "  / {print $NF}'`"
	end repeat
end try
set theName to "Install-Media"
tell application "Finder"
	set name of disk w to theName
end tell
