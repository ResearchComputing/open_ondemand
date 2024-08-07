#!/bin/bash
######################################################################################################
# To remove all symlinks in the directory /path/to/dir, execute this script as follows:
# 
# ./symlink_removal.sh /path/to/dir
######################################################################################################

# Define the target directory to start searching from
TARGET_DIR=$1

# Find all directories containing at least one symlink
dirs_w_symlink=$(find -L $TARGET_DIR -mindepth 1 -maxdepth 1 -xtype l)

# List the symlinks to be removed
echo "The following symlinks will be removed:"
for dir in $dirs_w_symlink; do
    echo "$dir"
done

# Confirm removal
read -p "Are you sure you want to remove these symlinks? (y/n): " confirm
if [[ $confirm == [yY] ]]; then
    # Remove the symlinks
    for dir in $dirs_w_symlink; do
        unlink $dir
        echo "unlinked $dir"
    done
else
    echo "Operation cancelled."
fi
