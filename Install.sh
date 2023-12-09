#!/bin/bash

package_name="$1"

# Check if the package is available in pacman
# if pacman -Ss "$package_name" >/dev/null 2>&1; then
# 	echo "Package $package_name found in pacman. Installing with pacman..."
# 	sudo pacman -S --noconfirm "$package_name"
# el
if paru -Ss "$package_name" >/dev/null 2>&1; then
	# If not found in pacman, try installing with paru
	echo "Package $package_name not found in pacman, but found in paru. Installing with paru..."
	paru -S --noconfirm "$package_name"
elif yay -Ss "$package_name" >/dev/null 2>&1; then
	# If not found in pacman or paru, try installing with yay
	echo "Package $package_name not found in pacman or paru, but found in yay. Installing with yay..."
	yay -S --noconfirm "$package_name"
else
	# If not found in any, display an error message
	echo "Package $package_name not found in pacman, paru, or yay. Check the package name or repository."
fi
