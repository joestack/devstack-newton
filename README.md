# devstack-newton
Creates an OpenStack newton release devstack environment using Vagrant 

Just download this repo and run:
`vagrant up`

It will install a devstack environment with a static IP address of **172.16.100.10** for the API

* Vagrant # The file to create a VM
* devstack.sh # A script file to install devstack inside the VM
* keystone_adminv3 # A file to set the environment to interact with the API

Prerequisites:
I'm using Ubuntu 16.04, Vagrant 2.0.2, Virtualbox 5.0
you need at least 8GB of RAM to run this virtual machine
