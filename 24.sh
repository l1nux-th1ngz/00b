#!/bin/bash

# Create directory /king
mkdir /king

# Change the permissions of nopw.sh to make it executable
sudo chmod u+x ~/nopw.sh

# Edit the sudoers file using visudo
sudo visudo -f /etc/sudoers

# Add the following line to the sudoers file
# slim ALL=(root) NOPASSWD: /home/slim/nopw.sh

# After saving the sudoers file, run the script as root
sudo ~/nopw.sh
