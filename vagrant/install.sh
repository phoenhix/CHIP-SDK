#!/bin/bash

VERSION=0.0.1

BUILDROOT_REPO=git@github.com:NextThingCo/CHIP-buildroot.git
TOOLS_REPO=git@github.com:NextThingCo/CHIP-tools.git
BUILDROOT_BRANCH=ak/chip-nand

TARGET_DIR=~/chip_sdk

#----------------------------------------------------------------------------#

echo -e "\n C.H.I.P SDK installer v${VERSION}\n"

if ! echo $HOSTNAME |grep -q vagrant; then
   echo -e "Not running inside vagrant currently not supported - sorry\n"
   exit 1
fi

setup_env_ubuntu1404.sh

if [ ! -d ${TARGET_DIR} ]; then
  mkdir ${TARGET_DIR}
fi
cd ${TARGET_DIR}

echo -e "\n Cloning & building ${BUILDROOT_REPO}"
LOCAL_REPO_NAME=${BUILDROOT_REPO##*/}
LOCAL_REPO_NAME=${LOCAL_REPO_NAME##CHIP-}
LOCAL_REPO_NAME=${LOCAL_REPO_NAME%.git}
git clone ${BUILDROOT_REPO} ${LOCAL_REPO_NAME}
pushd ${LOCAL_REPO_NAME}
git checkout ${BUILDROOT_BRANCH}
git pull
make chip_alex_defconfig
make
popd

echo -e "\n Cloning & building ${TOOLS_REPO}"
LOCAL_REPO_NAME=${TOOLS_REPO##*/}
LOCAL_REPO_NAME=${LOCAL_REPO_NAME##CHIP-}
LOCAL_REPO_NAME=${LOCAL_REPO_NAME%.git}
git clone ${TOOLS_REPO} ${LOCAL_REPO_NAME}
pushd ${LOCAL_REPO_NAME}
git checkout ${TOOLS_BRANCH}
git pull
popd
