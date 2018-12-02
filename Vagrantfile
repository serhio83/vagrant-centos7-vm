# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.define "vagrant1" do |vagrant1|
    vagrant1.vm.box = "centos/7"
    vagrant1.vm.network "private_network", ip: "10.10.10.2"
    vagrant1.vm.network "forwarded_port", guest: 80, host: 8001
    vagrant1.vm.hostname = "vagrant1"

    vagrant1.vm.provider "virtualbox" do |v|
      v.memory = 1024
      v.cpus = 1
    end

    vagrant1.vm.provision "shell" do |s|
      ssh_pub_key = File.readlines("#{Dir.home}/.ssh/id_rsa.pub").first.strip
      s.inline = <<-SHELL
        echo #{ssh_pub_key} >> /home/vagrant/.ssh/authorized_keys
        sudo bash -c "mkdir /root/.ssh && chmod 700 /root/.ssh"
        sudo bash -c "echo #{ssh_pub_key} >> /root/.ssh/authorized_keys"
      SHELL
    end
  end
  config.vm.define "vagrant2" do |vagrant2|
    vagrant2.vm.box = "centos/7"
    vagrant2.vm.network "private_network", ip: "10.10.10.3"
    vagrant2.vm.network "forwarded_port", guest: 80, host: 8002
    vagrant2.vm.hostname = "vagrant2"

    vagrant2.vm.provider "virtualbox" do |v|
      v.memory = 1024
      v.cpus = 1
    end

    vagrant2.vm.provision "shell" do |s|
      ssh_pub_key = File.readlines("#{Dir.home}/.ssh/id_rsa.pub").first.strip
      s.inline = <<-SHELL
        echo #{ssh_pub_key} >> /home/vagrant/.ssh/authorized_keys
        sudo bash -c "mkdir /root/.ssh && chmod 700 /root/.ssh"
        sudo bash -c "echo #{ssh_pub_key} >> /root/.ssh/authorized_keys"
      SHELL
    end
  end
end
