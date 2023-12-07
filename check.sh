#!/bin/bash

package_name="$1"

# Check if the package is available in pacman
if pacman -Ss "$package_name" >/dev/null 2>&1; then
	echo "file available in pacman"
elif paru -Ss "$package_name" >/dev/null 2>&1; then
	# If not found in pacman, try installing with paru
	echo "file available in paru"
elif yay -Ss "$package_name" >/dev/null 2>&1; then
	# If not found in pacman or paru, try installing with yay
	echo "file available in yay"
	yay -S --noconfirm "$package_name"
else
	# If not found in any, display an error message
	echo "file is not available anywhere"
fi
