#!/bin/bash

# Define the path to the sudoers file
sudoers_file="/etc/sudoers"

# Check if the script is run as root
if [ "$(id -u)" -ne 0 ]; then
    echo "This script must be run as root" >&2
    exit 1
fi

# Define the configuration line
config_line="%sudo ALL=(ALL) NOPASSWD: /usr/bin/apt, /usr/bin/apt-key, /usr/bin/apt-add-repository, /usr/bin/make"

# Add the configuration line to sudoers file
echo "$config_line" | sudo tee -a "$sudoers_file" > /dev/null

# Check if the configuration line was successfully added
if [ $? -eq 0 ]; then
    echo "Sudo configuration updated successfully"
else
    echo "Failed to update sudo configuration" >&2
    exit 1
fi
