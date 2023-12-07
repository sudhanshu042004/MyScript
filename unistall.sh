#!/bin/bash

package_name="$1"

# Check if the package is installed with paru
if paru -Qs "$package_name" >/dev/null 2>&1; then
	echo "Package $package_name found in paru. Uninstalling with paru..."
	paru -Rns --noconfirm "$package_name"
else
	# If not found in paru, try uninstalling with yay
	if yay -Qs "$package_name" >/dev/null 2>&1; then
		echo "Package $package_name not found in paru, but found in yay. Uninstalling with yay..."
		yay -Rns --noconfirm "$package_name"
	else
		# If not found in yay, try uninstalling with pacman
		if pacman -Qs "$package_name" >/dev/null 2>&1; then
			echo "Package $package_name not found in paru or yay, but found in pacman. Uninstalling with pacman..."
			sudo pacman -Rns --noconfirm "$package_name"
		else
			echo "Package $package_name not found in paru, yay, or pacman. Check the package name or verify that it is installed."
		fi
	fi
fi
