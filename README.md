# CHIP-SDK
Everything needed to develop software for C.H.I.P.

While it is possible to install the SDK natively on your computer, currently the only supported way is to run it from a virtual machine.

## System Requirements
1 GB RAM

## Getting started with the Vagrant image


### Installation
1. Install VirtualBox
2. Install VirtualBox Extension Pack for the host - this is necessary to flash C.H.I.P from inside the virtual machine.
3. Operating system specific stuff:
   - If you are on Windows, you need to add the VirtualBox installation directory to your PATH.
   - In case of a Ubuntu host: add your user to the vboxusers group!
4. Install Git
4. Git clone https://github.com/NextThingCo/CHIP-SDK

#### Start up the Virtual Machine
In a shell on the host type to following to start up the virtual machine:

    cd CHIP-SDK/vagrant
    vagrant up

#### Place you private ssh key
These steps won't be necessary after the repositories have been opened up:
 - create a ssh key pair and link the public key to your github account
 - copy the private ssh key (id_rsa) to chip_sdk/vagrant

#### Install software and build the flash image for CHIP
In a shell on the host log into the virtual machine by typing:

    vagrant ssh

Logged in to the virtual machine type:

    /vagrant/install.sh

#### Shutdown the Virtual machine
In a shell on the host type:

    vagrant halt

#### Troubleshooting
In case you run into trouble because the kernel in the VM was updated and the shared vagrant folder can no longer be mounted, update the guest additions by typing the following in the chip_sdk/vagrant directory on the host:

    vagrant plugin install vagrant-vbguest

Also look at [this blog post](http://kvz.io/blog/2013/01/16/vagrant-tip-keep-virtualbox-guest-additions-in-sync/)
