#!/usr/bin/env bash

DBPASSWD=test123

echo "Provisioning virtual machine..."
apt-get update
rm -rf /var/www
ln -fs /vagrant/www /var/www

echo "Installing VIM"
apt-get install vim -y > /dev/null

echo "Installing Git"
apt-get install git -y > /dev/null
    
echo "Installing Nginx"
apt-get install nginx -y > /dev/null

echo "Updating PHP repository"
apt-get install python-software-properties build-essential -y > /dev/null
add-apt-repository ppa:ondrej/php5 -y > /dev/null
apt-get update > /dev/null

echo "Installing PHP"
apt-get install php5-common php5-dev php5-cli php5-fpm -y > /dev/null
    
echo "Installing PHP extensions"
apt-get install curl php5-curl php5-gd php5-mcrypt php5-mysql -y > /dev/null

echo "Preparing MySQL"
apt-get install debconf-utils -y > /dev/null
debconf-set-selections <<< "mysql-server mysql-server/root_password password $DBPASSWD"
debconf-set-selections <<< "mysql-server mysql-server/root_password_again password $DBPASSWD"

echo "Installing MySQL"
apt-get install mysql-server -y > /dev/null

echo "Preparing Node.js"
curl --silent --location https://deb.nodesource.com/setup_0.12 | sudo bash - > /dev/null

echo "Installing Node.js"
apt-get install nodejs -y > /dev/null

echo "Configuring Nginx"
cp /vagrant/provision/config/nginx_vhost /etc/nginx/sites-available/nginx_vhost > /dev/null
ln -sf /etc/nginx/sites-available/nginx_vhost /etc/nginx/sites-enabled/
rm -rf /etc/nginx/sites-available/default
service nginx restart > /dev/null

