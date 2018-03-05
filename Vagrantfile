# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|

  config.vm.define "devstack" do |ps|
    ps.vm.box = "ubuntu/xenial64"
    ps.vm.hostname = "devstack"
    ps.vm.network "private_network", ip: "172.16.100.10"
    ps.vm.network "private_network", ip: "172.17.100.10"
    ps.vm.provision "shell", path: "devstack.sh"
  end

  config.vm.provider "virtualbox" do |vb|
    vb.memory = "8192"
  end
end



