#!/bin/bash
rccache() {
cd /tmp
rm ccache.tar.gz
}
echo "Removing Old CCACHE"
rccache

compress() {
time tar --use-compress-program="pigz -k -$2 " -cf $1.tar.gz $1 ccache 1
}
echo "Compressing New CCACHE"
time compress ccache 1

uccache() {
mkdir -p ~/.config/rclone
echo "$E" > ~/.config/rclone/rclone.conf
time rclone copy ccache.tar.gz $F -P
}
echo "Uploading CCACHE"
uccache

rom_upload() {
cd ~/
cd out/target/product/* && wget https://github.com/Sushrut1101/GoFile-Upload/raw/master/upload.sh
./upload.sh *.zip && ./upload.sh boot.img
}
echo "Uploading Rom & Boot From /Out"
rom_upload
