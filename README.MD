Vagrant setup: PHP7.1 + Apache2 + MySQL5.7 on Ubuntu16.04 box
==========

Setup demo php7.1 project using Vagrant with Ubuntu-16.04.
All required software will be installed automatically:
php7.1,
apache2,
mysql5.7.


## Setup

```
vagrant plugin install vagrant-vbguest
vagrant up
```

## Edit your local hosts file

```
sudo nano /etc/hosts
```

and add line

```
192.168.33.10 phptest
```

## That's it!

Open in our browser

```
http://phptest
or
http://phptest:8070
```
## Make modification

By default code inside ./phptest is running

### Change project configuration

#### Apache2 settings

```
Modify configs/apache
```

#### MySQL settings

```
Modify configs/mysql
```

#### PHP settings

```
Modify configs/php
```
