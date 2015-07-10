#!/bin/bash

VERSION=0.0.1

BUILDROOT_REPO=git@github.com:NextThingCo/CHIP-buildroot.git
#BUILDROOT_REPO=git@tau.free-electrons.com:nextthing/buildroot.git
BUILDROOT_BRANCH=nextthing/chip-nand

TARGET_DIR=~/chip_sdk

#----------------------------------------------------------------------------#

echo -e "\n C.H.I.P SDK installer v${VERSION}\n"

if ! echo $HOSTNAME |grep -q vagrant; then
   echo -e "Not running inside vagrant currently not supported - sorry\n"
   exit 1
else

  if [ ! -e ~/.ssh ]; then mkdir ~/.ssh; fi
  if [ ! -f ~/.ssh/id_rsa ]; then
    if [ -f /vagrant/id_rsa ]; then
      cp /vagrant/id_rsa ~/.ssh
      chmod 0600 ~/.ssh/id_rda
    fi
  fi

  echo "StrictHostKeyChecking no" >~/.ssh/config  

fi

echo -e "\n Installing packages"
sudo apt-get -y install build-essential git cmake unzip device-tree-compiler

if [ ! -d ${TARGET_DIR} ]; then
  mkdir ${TARGET_DIR}
fi
cd ${TARGET_DIR}

echo -e "\n Cloning & building ${BUILDROOT_REPO}"
LOCAL_REPO_NAME=${BUILDROOT_REPO##*/}
LOCAL_REPO_NAME=${LOCAL_REPO_NAME##CHIP-}
LOCAL_REPO_NAME=${LOCAL_REPO_NAME%.git}
git clone ${BUILDROOT_REPO} ${LOCAL_REPO_NAME}
cd ${LOCAL_REPO_NAME}
git checkout ${BUILDROOT_BRANCH}
make chip_defconfig
make
#
