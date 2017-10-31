# -*- mode: ruby -*-
# vi: set ft=ruby :

# vagrant plugin install vagrant-vbguest
Vagrant.configure("2") do |config|
  
  config.vm.box = "bento/ubuntu-16.04" # recommended by Hashicorp
  config.vm.box_check_update = false

  config.vm.network "forwarded_port", guest: 80, host: 8070
  config.vm.network "forwarded_port", guest: 3306, host: 3316

  config.vm.network "private_network", ip: "192.168.33.10"

  # fix mesg: ttyname failed: Inappropriate ioctl for device
  config.ssh.shell = "bash -c 'BASH_ENV=/etc/profile exec bash'"

  config.vm.synced_folder ".", "/var/www/vagrant", id: "vagrant-root", owner: "vagrant", group: "www-data", mount_options: ["dmode=755,fmode=755"]

  # provision "file" doesnt have root privileges
  # config.vm.provision "file", source: "./configs/apache/apache.projects.conf", destination: "/etc/apache2/sites-enabled/apache.projects.conf"

  # restart services after files are mount to apply configuration
  config.vm.provision :shell, path: "./configs/bootstrap.sh", run: 'always'

  config.vm.provider "virtualbox" do |vb|
      vb.memory = "1024"
  	  vb.cpus = 2
  end

  config.vm.provision "shell", inline: <<-SHELL
    apt update
    apt-get install -y language-pack-en-base
    LC_ALL=en_US.UTF-8
    LANG=en_US.UTF-8
    LC_ALL=C.UTF-8 add-apt-repository -y ppa:ondrej/php
    apt update
    apt install -y apache2
    apt install -y curl
    apt install -y php7.1
    apt install -y php-mbstring
    apt install -y php-gd
    apt install -y php-imap
    apt install -y php-intl
    apt install -y php-xdebug
    apt install -y php-curl
    apt install -y php-mysql
    apt install -y php-cli
    apt install -y php-readline
    apt install -y php-mcrypt
    apt install -y libapache2-mod-php
    a2enmod rewrite
    apt install -y sendmail
    debconf-set-selections <<< 'mysql-server mysql-server/root_password password 111'
	debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password 111'
    apt install -y mysql-server
    ln -s /var/www/vagrant/configs/apache/apache.projects.conf /etc/apache2/sites-available/apache.projects.conf
    a2ensite apache.projects
    ln -s /var/www/vagrant/configs/mysql/mysql.projects.conf /etc/mysql/mysql.conf.d/mysql.projects.conf
    ln -s /var/www/vagrant/configs/php/php.projects.ini /etc/php/7.1/apache2/conf.d/php.projects.ini
    service apache2 restart
    service mysql restart
  SHELL
end
