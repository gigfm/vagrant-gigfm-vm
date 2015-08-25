Vagrant.configure("2") do |config|
	config.vm.box = "hashicorp/precise64"
	config.vm.network :private_network, ip: "192.168.56.10"

	config.vm.provider "virtualbox" do |v|
	    v.name = "dev-vm"
	    v.customize ["modifyvm", :id, "--memory", "768"]
	end

	config.vm.provision "shell" do |s|
		s.path = "provision/bootstrap.sh"
	end  
end
