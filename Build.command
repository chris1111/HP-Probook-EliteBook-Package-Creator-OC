PARENTDIR=$(dirname "$0")
cd "$PARENTDIR"
APP_NAME="build"

xcodebuild -project ./HP-ProBook-EliteBook.xcodeproj -alltargets -configuration Release

zip -r "$APP_NAME".zip "$APP_NAME"

