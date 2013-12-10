#!/bin/sh

set -e

case "${1}" in
	prereqs)
		exit 0
		;;
esac

rm -rf /dev/block/mtd/by-name/
mkdir -p /dev/block/mtd/by-name
for i in `ls -d /sys/class/mtd/mtd*[0-9]`; do
    name=`cat $i/name`
    tmp="`echo $i | sed -e 's/mtd/mtdblock/g'`"
    dev="`echo $tmp |sed -e 's/\/sys\/class\/mtdblock/\/dev/g'`"
    ln -s $dev /dev/block/mtd/by-name/$name
done

exit 0

