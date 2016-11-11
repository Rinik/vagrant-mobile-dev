# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  # Settings for vm
  config.vm.box = "bento/ubuntu-16.04"
  config.vm.hostname = "cordova"
  config.vm.network "private_network", ip: "192.168.69.11"
  config.vm.network "forwarded_port", guest: 8100, host: 8100
  config.vm.network "forwarded_port", guest: 35729, host: 35729

  # Change memory from default value
  config.vm.provider "virtualbox" do |vb|
    vb.customize ["modifyvm", :id, "--memory", "2048"]
  end

  # Initial configuration
  config.vm.provision "shell", path: "./config/config.sh"

  # Synced folder remove comment if needed
  #config.vm.synced_folder "app/", "/home/vagrant/app"

  config.ssh.forward_agent = true
  config.ssh.forward_x11 = true

end
