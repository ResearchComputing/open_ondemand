#!/bin/bash

# path to development directory 
dev_dir=/curc/admin/ood/development

# path to ondemand-dev apps/sys directory 
app_sys_dir=/var/www/ood/apps/sys

# Confirm deployment
read -p "Are you sure you want to deploy to the development server? (y/n): " confirm
if [[ $confirm == [yY] ]]; then

    # remove all current symlinks in /var/www/ood/apps/sys
    $dev_dir/symlink_removal.sh  $app_sys_dir

    # symlink all directories in $dev_dir/apps to /var/www/ood/apps/sys
    $dev_dir/symlink_add.sh $dev_dir/apps $app_sys_dir

else
    echo "Operation cancelled."
fi
