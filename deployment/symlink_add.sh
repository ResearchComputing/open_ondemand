#!/bin/bash
######################################################################################################
# To symlink all sub directories in /path/to/dir to /path/to/gen/symlink, execute this script as 
# follows:
# 
# ./symlink_add.sh /path/to/dir /path/to/gen/symlink
######################################################################################################

# define the source directory that contains the directories to symlink (e.g. /curc/admin/ood/development/apps)
SOURCE_DIR=$1

# define the target directory that will contain symlinks (e.g. /var/www/ood/apps/sys)
TARGET_DIR=$2

# find all subdirectories of the given path 
app_dirs=$(find $SOURCE_DIR -mindepth 1 -maxdepth 1 -type d)

# print the directories that will be symlinked to the target directory and symlink them 
echo "The following symlinks will be created"
for app in $app_dirs; do
    echo "symlinking $app to $TARGET_DIR"
done

# Confirm removal
read -p "Are you sure you want to add these symlinks? (y/n): " confirm
if [[ $confirm == [yY] ]]; then
    for app in $app_dirs; do
        ln -s $app $TARGET_DIR
    done 
else
    echo "Operation cancelled."
fi