#!/bin/bash -e

SIZE=4G
SOURCE=./output.tar
TARGET=./axiom.img
OUTPUT=./axiom-beta-rootfs.tar.xz

rm -f $TARGET

# Get the latest generated root file system
docker run --name output --rm -d medicineyeh/axiom-sim /bin/sleep 9999 && docker export output -o ${SOURCE} && docker kill output

# Create the image file
fallocate -l $SIZE $TARGET

# Write the partition table
sfdisk -uS $TARGET << EOF
    size=50M, type=b
    size=${SIZE}, type=83
EOF

# Mount loop device
dev=$(losetup --show -Pf $TARGET)

# Format partitions if the file does not exist
mkfs.vfat -n "BOOT" -F 32 ${dev}p1
mkfs.ext4 ${dev}p2

# Mount
mount ${dev}p2 /mnt
mkdir -p /mnt/boot
mount ${dev}p1 /mnt/boot

if [  "/mnt" = "$(stat --printf '%m' "/mnt")" ]; then
    echo "Extracting source..."
    bsdtar -xf $SOURCE -C /mnt
else
    echo "Error: /mnt is not a mount point."
fi

# Umount
umount -R /mnt
losetup -d $dev


# Compress file
bsdtar -Jcf $OUTPUT $TARGET
