# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.box = "ubuntu/bionic64"

  #Forward port from localhost:8080 from host to the VM
  config.vm.network "forwarded_port", guest: 8080, host: 8080

  #Set the memory to 2GB
  config.vm.provider "virtualbox" do |vb|
    vb.memory = "2048"
  end
 
  config.vm.provision "shell", name: "java7", path: "scripts/installJava7.sh"
  config.vm.provision "shell", name: "zeppelin", path: "scripts/installZeppelin.sh"
  
end