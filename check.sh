#!/bin/sh
sudo cp /media/sf_share/root.ext4 ~
MOUNT_DIR=/tmp/rootfs
if [ -d $MOUNT_DIR ]; then
    sudo umount $MOUNT_DIR 2>/dev/null
else
    mkdir $MOUNT_DIR
fi
sudo mount -t ext4 ~/root.ext4 $MOUNT_DIR
cd $MOUNT_DIR

_check_file_ ()
{
    if [ ! -f "$1" ]; then
        echo "  [\033[0;31m不存在\033[0m] \t$1..."
    else
        echo "  [\033[0;32m存在\033[0m] \t$1..."
    fi
}

_find_file_ ()
{
    file_name=$1
    find $MOUNT_DIR -name "$1" |
    awk  -v fname=$1 -v count=0 ' { count++; print "  [\033[0;32m存在\033[0m] \t"$0"..." } END{ if (count == 0) { print "  [\033[0;31m不存在\033[0m] \t"fname"..." } } '
}

#_check_file_    etc/rcS.d/S40networking.sh 
#_check_file_    etc/rcS.d/S40dropbear.sh 
#_check_file_    etc/rcS.d/S40utelnetd.sh 
#_check_file_    usr/bin/gdbserver 

if [ $# = 1 ]; then
    _find_file_ $1
else
    _find_file_ S40networking
    _find_file_ S40dropbear.sh
    _find_file_ gdbserver
    _find_file_ S40utelnetd.sh
fi
