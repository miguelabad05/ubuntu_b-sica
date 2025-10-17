#!/bin/bash

set -e

sudo apt update && sudo apt upgrade -y

sudo apt install apache2 -y
sudo systemctl enable apache2
sudo systemctl start apache2

sudo apt install mysql-server -y
sudo systemctl enable mysql
sudo systemctl start mysql

sudo mysql_secure_installation

sudo apt install php libapache2-mod-php php-mysql php-cli php-curl php-gd php-mbstring php-xml php-xmlrpc php-zip -y

sudo systemctl restart apache2

echo "<?php phpinfo(); ?>" | sudo tee /var/www/html/info.php

sudo chown -R www-data:www-data /var/www/html
sudo chmod -R 755 /var/www/html

echo "Verifica PHP en: http://localhost/info.php"
