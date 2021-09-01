# Command Line EFI Mounter
# (c) Copyright 2017 chris1111 
# Copyright (c) 2016 CorpNewt Credit: for MountEFI
#
PARENTDIR=$(dirname "$0")
cd "$PARENTDIR"
defaults write com.apple.terminal "Default Window Settings" "Pro"
defaults write com.apple.terminal "Startup Window Settings" "Pro"
printf '\e[8;30;80t'
./Main.sh
