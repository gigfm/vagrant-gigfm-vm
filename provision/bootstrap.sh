#!/usr/bin/env bash

DBPASSWD=test123

echo "Provisioning virtual machine..."

apt-get update > /dev/null
apt-get install python-software-properties build-essential -y > /dev/null

rm -rf /var/www
ln -fs /vagrant/www /var/www

echo "Installing VIM"
apt-get install vim -y > /dev/null

echo "Installing Git"
add-apt-repository ppa:git-core/ppa -y > /dev/null
apt-get update > /dev/null
apt-get install git -y > /dev/null
    
echo "Installing Nginx"
apt-get install nginx -y > /dev/null

echo "Updating PHP repository"
add-apt-repository ppa:ondrej/php5 -y > /dev/null
apt-get update > /dev/null

echo "Installing PHP"
apt-get install php5-common php5-dev php5-cli php5-fpm -y > /dev/null
    
echo "Installing PHP extensions"
apt-get install curl php5-curl php5-gd php5-mcrypt php5-mysql -y > /dev/null
curl -sS https://getcomposer.org/installer | php > /dev/null

echo "Preparing MySQL"
apt-get install debconf-utils -y > /dev/null
debconf-set-selections <<< "mysql-server mysql-server/root_password password $DBPASSWD"
debconf-set-selections <<< "mysql-server mysql-server/root_password_again password $DBPASSWD"

echo "Installing MySQL"
apt-get install mysql-server -y > /dev/null

echo "Updating MongoDB repository"
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10 > /dev/null
echo "deb http://repo.mongodb.org/apt/ubuntu "$(lsb_release -sc)"/mongodb-org/3.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.0.list > /dev/null
sudo apt-get update > /dev/null

echo "Installing MongoDB"
sudo apt-get install -y mongodb-org > /dev/null

echo "Preparing Node.js"
curl --silent --location https://deb.nodesource.com/setup_0.12 | sudo bash - > /dev/null

echo "Installing Node.js"
apt-get install nodejs -y > /dev/null
npm update -g npm

echo "Install Bower"
npm install -g bower > /dev/null

echo "Install Grunt"
npm install -g grunt-cli > /dev/null

echo "Configuring Nginx"
cp /vagrant/provision/config/nginx_vhost /etc/nginx/sites-available/nginx_vhost > /dev/null
ln -sf /etc/nginx/sites-available/nginx_vhost /etc/nginx/sites-enabled/
rm -rf /etc/nginx/sites-available/default
service nginx restart > /dev/null

