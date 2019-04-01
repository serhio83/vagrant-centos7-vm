# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.define "vm1" do |vm1|
    vm1.vm.box = "centos/7"
    vm1.vm.network "private_network", ip: "10.10.10.2"
    vm1.vm.hostname = "vm1"
    vm1.vm.provider "virtualbox" do |v|
      v.default_nic_type = "Am79C973"
      v.memory = 2048
      v.cpus = 1
    end
    vm1.vm.provision "shell" do |s|
      ssh_pub_key = File.readlines("#{Dir.home}/.ssh/id_rsa.pub").first.strip
      s.inline = <<-SHELL
        echo #{ssh_pub_key} >> /home/vagrant/.ssh/authorized_keys
        sudo bash -c "mkdir /root/.ssh && chmod 700 /root/.ssh"
        sudo bash -c "echo #{ssh_pub_key} >> /root/.ssh/authorized_keys"
      SHELL
    end
  end
  config.vm.define "vm2" do |vm2|
    vm2.vm.box = "centos/7"
    vm2.vm.network "private_network", ip: "10.10.10.3"
    vm2.vm.hostname = "vm2"
    vm2.vm.provider "virtualbox" do |v|
      v.default_nic_type = "Am79C973"
      v.memory = 2048
      v.cpus = 1
    end
    vm2.vm.provision "shell" do |s|
      ssh_pub_key = File.readlines("#{Dir.home}/.ssh/id_rsa.pub").first.strip
      s.inline = <<-SHELL
        echo #{ssh_pub_key} >> /home/vagrant/.ssh/authorized_keys
        sudo bash -c "mkdir /root/.ssh && chmod 700 /root/.ssh"
        sudo bash -c "echo #{ssh_pub_key} >> /root/.ssh/authorized_keys"
      SHELL
    end
  end
  config.vm.define "vm3" do |vm3|
    vm3.vm.box = "centos/7"
    vm3.vm.network "private_network", ip: "10.10.10.4"
    vm3.vm.hostname = "vm3"
    vm3.vm.provider "virtualbox" do |v|
      v.default_nic_type = "Am79C973"
      v.memory = 2048
      v.cpus = 1
    end
    vm3.vm.provision "shell" do |s|
      ssh_pub_key = File.readlines("#{Dir.home}/.ssh/id_rsa.pub").first.strip
      s.inline = <<-SHELL
        echo #{ssh_pub_key} >> /home/vagrant/.ssh/authorized_keys
        sudo bash -c "mkdir /root/.ssh && chmod 700 /root/.ssh"
        sudo bash -c "echo #{ssh_pub_key} >> /root/.ssh/authorized_keys"
      SHELL
    end
  end
end
