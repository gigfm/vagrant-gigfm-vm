# web-vm
Basic Vagrant Development Box

A simple box for demo-ing Vagrant and setting up a basic web development vm.

# Use

1. Install [VirtualBox](https://www.virtualbox.org/)
2. Install [Vagrant](https://www.vagrantup.com/)
3. `mkdir ~/dev-web`
    * your projects will go in here - ex: `~/dev-web/lib1`, `~/dev-web/lib2`, `~/dev-web/app1`, etc...)
    * When all setup, the `~/dev-web` folder on your machine will be linked to the `var/www` folder on the VM.4.
    * If this directory conflics with your local setup, name it something else and update where the Vagrantfile references `~/dev-web` once you have cloned this repo...
4. Clone this repo (I found it useful to create a `~/vagrant/` directory and cloning it in there)
5. cd into your new `web-vm` directory
6. Run `vagrant up`
7. ssh into the web-vm vagrant box with `vagrant ssh`
8. `/var/www` on the web-vm is sync'd with ~/dev-web` on your host computer.  Add your projects in there.

You now have a working VM that you can use for development.



