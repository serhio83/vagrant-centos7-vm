# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "centos/7"
  config.vm.network "private_network", ip: "10.10.10.2"
  config.vm.network "forwarded_port", guest: 80, host: 8080
  config.vm.hostname = "node01.vm"

  config.vm.provider "virtualbox" do |v|
    v.memory = 1024
    v.cpus = 1
  end
  
  config.vm.provision "shell" do |s|
    ssh_pub_key = File.readlines("#{Dir.home}/.ssh/id_rsa.pub").first.strip
    s.inline = <<-SHELL
      echo #{ssh_pub_key} >> /home/vagrant/.ssh/authorized_keys
      sudo bash -c "mkdir /root/.ssh && chmod 700 /root/.ssh"
      sudo bash -c "echo #{ssh_pub_key} >> /root/.ssh/authorized_keys"
    SHELL
  end
end
