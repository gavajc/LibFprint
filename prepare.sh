#!/bin/bash -e

# DEVELOPED BY: Juan Carlos García Vázquez
#        EMAIL: gavajc@gmail.com
#         DATE: 23/11/2020
#
# Script for patch sources and prepare it for cross compilation
# between Linux and Windows using MSYS2.
#
# This script and all patches were tested with libfprint
# sources version:
#                  1.90.1
#

libfprint_dir=$1
patches_dir="./patches"
done_patch_file="$libfprint_dir/.src_patched"

if [ -z "$libfprint_dir" ] || [ ! -d "$libfprint_dir" ]
then
    echo "The libfprintf '$libfprint_dir' source directory doesn't exists"
else
    if [ -f "$done_patch_file" ]
    then
        echo "****** The sources have been patched. Nothing to do ******"
    else
        
        for entry in "$patches_dir"/*.patch
        do
          patch_file="$(basename $entry)"
          cp $entry $libfprint_dir
          if (cd $libfprint_dir && ! patch -R -p0 -s -f --dry-run --silent < $patch_file 2>&1 > /dev/null); then
             echo "Applying patch file: $patch_file"
             (cd $libfprint_dir && patch -t -p0 < $patch_file);
          fi
        done
        
        rm -f $libfprint_dir/*.patch
        touch $done_patch_file
        echo "****** All files have been patched successfully ******"
    fi
fi
