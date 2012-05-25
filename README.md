## Description

Collection of Vagrant files and Chef cookbooks to install virtual machines for different purposes:

- Zend Server Community Edition with PHP 5.3 (Vagrantfile.zend-server-ce-php53)
- Zend Server Community Edition with PHP 5.4 (Vagrantfile.zend-server-ce-php54)

## Requirements

- [VirtualBox](https://www.virtualbox.org)
- [Vagrant](http://vagrantup.com)

## Installation

There is no default Vagrantfile. It has to be created and if required to be configured.

### Zend Server Community Edition PHP 5.4

1. Create a Vagrantfile by copy  
  
	```shell
	cp Vagrantfile.zend-server-ce-php54 Vagrantfile
	```
	
1. Alter `Vagrantfile`	and change hostname and/or IP if needed:  

	```ruby
	config.vm.host_name = "myhostname"
	config.vm.network :hostonly, "192.168.100.15"
	```
	
1. Start Vagrant and install everything  

	```shell
	vagrant up
	```
	
After this you can lean back and when it’s finished you can connect to your vagrant machine via `vagrant ssh` or open the browser and type in the IP.

### Zend Server Community Edition PHP 5.3

1. Create a Vagrantfile by copy  

	```shell
	cp Vagrantfile.zend-server-ce-php53 Vagrantfile
	```
	
After this step you can continue with step 2 from above.

### Accessing the Zend Server GUI via HTTP

[http://192.168.100.15:10081](http://192.168.100.15:10081) or [http://192.168.100.15:10081](http://192.168.100.15:10081)

### SSH-Config (optional)

The following step is optional but creates more comfort for the developer by adding the vagrant machine’s ip address to the ssh config you’re able to easily connect to it via `ssh myhostname`:

	# ~/.ssh/config
	# $vm_host_name = "myhostname"
	# $vm_ip_address = "192.168.100.15"
	
	Host default
	  HostName 192.168.100.11
	  Port 22
	  User vagrant
	  UserKnownHostsFile /dev/null
	  StrictHostKeyChecking no
	  PasswordAuthentication no
	  IdentityFile ~/.vagrant.d/insecure_private_key
	  IdentitiesOnly yes

### Host-Config

For even more comfort during development you can alter your computer’s hostfile to know which ip belongs to your `myhostname` you just have to add the ip and hostname to it:

	# /etc/hosts
	192.168.100.15 myhostname
	
After that you can access the Zend Server GUI via HTTP with this simple URL:
[http://myhostname:10081](http://myhostname:10081)