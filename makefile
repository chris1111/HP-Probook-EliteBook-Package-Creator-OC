HP-ProBookEliteBook:
	@echo "Building HP-ProBook-EliteBook..."
	@$/xcodebuild -project "HP-ProBook-EliteBook.xcodeproj" -alltargets -configuration Release
	@$/HP-ProBook-EliteBook/HP_ProBook_EliteBook && Open ./build/Release


.PHONY: HP-ProBookEliteBook clean

