# web-vm
Basic Vagrant development box for the gigfm project

# Use

1. Install [VirtualBox](https://www.virtualbox.org/)
2. Install [Vagrant](https://www.vagrantup.com/)
3. `mkdir ~/dev-gigfm`
4. Clone this repo (I found it useful to create a `~/vagrant/` directory and cloning it in there)
5. cd into your cloned directory
6. Run `vagrant up`
7. Add `192.168.56.11 gigfm-vm` to your `/etc/hosts` file
8. Browse to `http://gigfm-vm` in your browser

You now have a working VM that you can use for development and testing locally.



