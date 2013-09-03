$install_chef = <<SCRIPT
apt-get update
apt-get install curl -y
curl -L https://www.opscode.com/chef/install.sh | sudo bash
SCRIPT

Vagrant.configure("2") do |config|
  config.vm.hostname = "lxc"
  config.vm.box = "opscode-ubuntu-12.10-provisionerless"
  config.vm.box_url = "https://opscode-vm.s3.amazonaws.com/vagrant/opscode_ubuntu-12.10_provisionerless.box"

  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--name", "lxc"]
    vb.customize ["modifyvm", :id, "--cpus", "2"]
    vb.customize ["modifyvm", :id, "--memory", "3072"]
  end

  config.vm.provision :shell, :inline => $install_chef

  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = ["cookbooks", "site-cookbooks"]
    chef.add_recipe "packages"
  end

  config.vm.synced_folder "~/.ssh", "/home/vagrant/.ssh"
  config.vm.synced_folder "~/.emacs.d", "/home/vagrant/.emacs.d"
  config.vm.synced_folder "~/projects", "/home/vagrant/projects"

  # config.ssh.private_key_path = "~/.ssh/id_rsa"
end
