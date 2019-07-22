#!/c/mint/bin/sh
# Check filesystems on normal boot or after systemcrash.
#

if [ -f /etc/fastboot ]; then
	echo "Fast boot. Skipping filesystem checks."
	rm -f /etc/fastboot
else
	ext2drives=`grep -v '^#' /etc/fstab | \
	while read drv mntp type owner group perm; do
		if [ "X$type" = Xext2 ]; then
			echo "$drv"
		fi
	done`
	mfsdrives=`grep -v '^#' /etc/fstab | \
	while read drv mntp type owner group perm; do
		if [ "X$type" = Xminix ]; then
			echo "$drv"
		fi
	done`
	dosdrives=`grep -v '^#' /etc/fstab | \
	while read drv mntp type owner group perm; do
		if [ "X$type" = Xdos ]; then
			echo "$drv"
		fi
	done`
	f32drives=`grep -v '^#' /etc/fstab | \
	while read drv mntp type owner group perm; do
		if [ "X$type" = Xf32 ]; then
			echo "$drv"
		fi
	done`
	
	for drv in $ext2drives; do
		echo; echo "Checking filesystem on drive $drv."
		fsck.ext2 -p -C 0 $drv:
		if [ $? -ge 2 ]; then
			echo
			echo "Warning: e2fsck FAILED ($?)"
			echo "         Starting single user shell. Fix the"
			echo "         filesystem on drive $drv by running fsck.ext2"
			echo "         and REBOOT!"
			echo
			sh -si < /dev/console > /dev/console 2>&1
		fi
	done
	for drv in $mfsdrives; do
		echo; echo "Checking filesystem on drive $drv."
		fsck.minix -p $drv:
		if [ $? -ne 0 ]; then
			echo
			echo "Warning: fsck FAILED"
			echo "         Starting single user shell. Fix the"
			echo "         filesystem on drive $drv by running fsck.minix"
			echo "         and REBOOT!"
			echo
			sh -si < /dev/console > /dev/console 2>&1
		fi
	done
#	for drv in $dosdrives; do
#		echo; echo "Checking filesystem on drive $drv."
#		fsck.vfat -p $drv:
#		if [ $? -ne 0 ]; then
#			echo
#			echo "Warning: fsck FAILED"
#			echo "         Starting single user shell. Fix the"
#			echo "         filesystem on drive $drv by running fsck.vfat"
#			echo "         and REBOOT!"
#			echo
#			sh -si < /dev/console > /dev/console 2>&1
#		fi
#	done
fi
