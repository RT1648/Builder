#!/bin/bash
build() {
source build/envsetup.sh || . build/envsetup.sh
lunch $MAKEFILENAME-$VARIENT
export CCACHE_DIR=/tmp/ccache
export CCACHE_EXEC=$(which ccache)
export USE_CCACHE=1
ccache -M 50G
ccache -o compression=true
ccache -z
$EXTRACMD
$TARGET #& sleep 95m
}
echo "Initializing Build System"
build
