HP-ProBookEliteBook:
	@echo "Building HP-ProBook-EliteBook..."
	@$/xcodebuild -project "HP-ProBook-EliteBook.xcodeproj" -alltargets -configuration Release
	@$/cp -Rp ./Package/HP-ProBook-EliteBook ./build/Release/HP-ProBook-EliteBook.app/Contents/MacOS && Open ./build/Release


.PHONY: OpenCore Creator clean

