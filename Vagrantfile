# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.configure(2) do |config|
  config.vm.box = "xcoo/xenial64"

  #by default we'll claim ports 7000-7999 on the host system
  #for i in 7000..7999
  #  config.vm.network :forwarded_port, guest: i, host: i
  #end

  #NB: this folder mapping will not have the boot2docker issue of slow sync
  #config.vm.synced_folder "~/dev", "/home/vagrant/dev"

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  config.vm.network "private_network", ip: "192.168.69.211"

  config.vm.provider "virtualbox" do |vb|
  #   # Display the VirtualBox GUI when booting the machine
  #   vb.gui = true
  #
  #   # Customize the amount of memory on the VM:
      #vb.memory = "1024"
      #vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
      #vb.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
      vb.name = "golang_rpc_server_nginx_sample"
  end


  config.vm.provision :shell, path: "bin/vagrant_provision_docker.sh"
end
