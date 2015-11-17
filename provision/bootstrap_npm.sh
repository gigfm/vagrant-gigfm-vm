echo "Configure npm"
# Create a folder for npm global files to be installed to (if it does not already exist)
if ! grep -q "/npm-global/bin" ~/.bashrc;
then
	mkdir ~/npm-global
	npm config set prefix '~/npm-global'
	echo "export PATH=$PATH:~/npm-global/bin" >> /home/vagrant/.bashrc
fi

npm update -g npm

echo "Install Bower"
npm install -g bower > /dev/null

echo "Install Grunt"
npm install -g grunt-cli > /dev/null

echo "Install eslint"
npm install -g eslint > /dev/null

echo "Install Buster.js"
npm instll -g buster > /dev/null

echo "Install Webpack"
npm instll -g webpack > /dev/null

echo "Install babel"
npm instal -g babel > /dev/null

echo "Install Yeoman"
npm install -g yo > /dev/null

echo "Preparing PhantomJs"
apt-get install libfontconfig > /dev/null # This is a hidden phantomjs dependency: https://github.com/ariya/phantomjs/issues/10904

echo "Install PhantomJs"
npm install -g phantomjs > /dev/null