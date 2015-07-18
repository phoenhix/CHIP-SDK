# CHIP-SDK
Everything needed to develop software for C.H.I.P.

While it is possible to install the SDK natively on your computer, currently the only supported way is to run it from a virtual machine.

## System Requirements
A version of Windows, Mac OS X or your favourite Linux distribution running VirtualBox and Vagrant.
For the virtual machine at least of free 1 GB RAM are necessary.
Up to 40 GB of disk space may be used.

## Getting started with the Vagrant image

### Installation

1. Install VirtualBox
2. Install VirtualBox Extension Pack for the host - this is necessary to flash C.H.I.P from inside the virtual machine.
3. Operating system specific stuff:
   - If you are on Windows, you need to add the VirtualBox installation directory to your PATH.
   - In case of a Ubuntu host: add your user to the vboxusers group!
4. Install Git
4. Git clone https://github.com/NextThingCo/CHIP-SDK


### Start up the Virtual Machine

In a shell on the host type to following to start up the virtual machine:

    cd CHIP-SDK/vagrant
    vagrant up


### Login to the Virtual mashine

In a shell on the host type to following:

    cd CHIP-SDK/vagrant
    vagrant ssh

### Shutdown the Virtual machine
In a shell on the host type:

    vagrant halt

### Troubleshooting
In case you run into trouble because the kernel in the VM was updated and the shared vagrant folder can no longer be mounted, update the guest additions by typing the following in the chip_sdk/vagrant directory on the host:

    vagrant plugin install vagrant-vbguest

Also look at [this blog post](http://kvz.io/blog/2013/01/16/vagrant-tip-keep-virtualbox-guest-additions-in-sync/)


## Build the flash image for CHIP

### Start the build process
In a shell on the host log into the virtual machine by typing:

    vagrant ssh

Logged in to the virtual machine type:

    /vagrant/install.sh


## Flash a new C.H.I.P for the first time

Login to the virtual machine:

    vagrant ssh
    cd $HOME/chip_sdk/tools
    sudo BUILDROOT_OUTPUT_DIR=../buildroot/output ./chip-fel-flash.sh erase-bb     

Plese note the 'erase-bb' option which causes the bad block table of the NAND to be erased. This is not necessary for C.H.I.Ps that have already been flashed.


