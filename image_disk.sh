#!/bin/sh

disk=$1
image=$2
disk_name=$3

diskutil eraseDisk ExFat $disk_name $disk;
diskutil unmountDisk $disk;
sudo dd if=$image of=$disk bs=2m;
