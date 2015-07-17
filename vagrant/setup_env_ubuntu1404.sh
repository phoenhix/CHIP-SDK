#!/bin/bash

echo -e "\n Setting up environment in Ubuntu 14.04"
sudo apt-get -y update
sudo apt-get -y install \
 build-essential \
 git \
 cmake \
 unzip \
 device-tree-compiler \
 libncurses-dev \
 cu \
 linux-image-extra-virtual

echo -e "\n Adding current user to dialout group"
sudo add ${USER} dialout
