#!/bin/bash
setup() {
sudo apt update &&sudo apt install pigz wget jq curl -y
sudo apt upgrade -y
}
echo "Setting Up AOSP Build Environment"
setup

ccache() {
cd /tmp
time aria2c $LINK -x16 -s50 || echo "No ccache link provided, build will fail due to time limit"
time tar xf ccache.tar.gz
cd ~/
}
echo "Downloading CCACHE"
ccache
