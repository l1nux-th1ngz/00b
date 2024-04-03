#!/bin/bash

# Define the folder name
folder_name="folder_to_delete"

# Move all .sh files to the home directory
mv *.sh ~/
if [ $? -ne 0 ]; then
    echo "Failed to move .sh files to home directory"
    exit 1
fi

# Move all .deb files to the home directory
mv *.deb ~/
if [ $? -ne 0 ]; then
    echo "Failed to move .deb files to home directory"
    exit 1
fi

# Delete the folder
rm -rf "$folder_name"
if [ $? -ne 0 ]; then
    echo "Failed to delete folder: $folder_name"
    exit 1
fi

# Download the folder again
wget -q "url_to_download/$folder_name.tar.gz"
if [ $? -ne 0 ]; then
    echo "Failed to download $folder_name.tar.gz"
    exit 1
fi

# Extract the downloaded folder
tar -xzf "$folder_name.tar.gz"
if [ $? -ne 0 ]; then
    echo "Failed to extract $folder_name.tar.gz"
    exit 1
fi

# Change directory to the extracted folder
cd "$folder_name"

# Change permissions of .sh files to 755
for file in *.sh; do
    echo "Changing permissions for file: $file"
    chmod 755 "$file"
done

echo "Script execution completed successfully."
