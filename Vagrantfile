Vagrant.configure("2") do |config|
	config.vm.box = "hashicorp/precise64"
	config.vm.hostname = "dev-vm"
	config.vm.network :private_network, ip: "192.168.56.10"

	config.ssh.forward_agent = true

	config.vm.provider "virtualbox" do |vb|
	    vb.name = "dev-vm"
	    vb.customize ["modifyvm", :id, "--memory", "768"]
	end

	config.vm.provision "file", source: "~/.gitconfig", destination: "~/.gitconfig"
	config.vm.provision "shell", path: "provision/bootstrap.sh", privileged: true
	config.vm.provision "shell", path: "provision/bootstrap_npm.sh", privileged: false	
	config.vm.synced_folder "~/dev", "/var/www", type: "nfs"
end
