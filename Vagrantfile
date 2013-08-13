$install_chef = <<SCRIPT
apt-get update
apt-get install wget -y
wget https://opscode-omnibus-packages.s3.amazonaws.com/ubuntu/11.04/x86_64/chef_11.4.0-1.ubuntu.11.04_amd64.deb
dpkg -i chef_11.4.0-1.ubuntu.11.04_amd64.deb
SCRIPT

Vagrant.configure("2") do |config|
  config.vm.hostname = "lxc"
  config.vm.box = "precise64"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"

  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--name", "lxc"]
    vb.customize ["modifyvm", :id, "--cpus", "2"]
    vb.customize ["modifyvm", :id, "--memory", "4096"]
  end

  config.vm.provision :shell, :inline => $install_chef

  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = ["cookbooks", "site-cookbooks"]
    chef.add_recipe "packages"
    chef.add_recipe "docker"
  end

  config.vm.synced_folder "~/.ssh", "/home/vagrant/.ssh"
  config.vm.synced_folder "~/.emacs.d", "/home/vagrant/.emacs.d"
  config.vm.synced_folder "~/projects", "/home/vagrant/projects"
end
