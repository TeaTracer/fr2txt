# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
    config.vm.define "arch" do |arch|
        arch.vm.box = "terrywang/archlinux"
        arch.vm.hostname = "arch"
        arch.vm.provider "virtualbox" do |vb|
            vb.gui = false
            vb.name = "arch"
            vb.memory = "512"
            vb.cpus = "2"
        end
    end
    config.vm.define "ubuntu" do |ubuntu|
        ubuntu.vm.box = "geerlingguy/ubuntu1604"
        ubuntu.vm.hostname = "ubuntu"
        ubuntu.vm.provider "virtualbox" do |vb|
            vb.gui = false
            vb.name = "ubuntu"
            vb.memory = "512"
            vb.cpus = "2"
        end
    end
end

