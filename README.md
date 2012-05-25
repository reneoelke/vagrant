# Description

Collection of Vagrant files and Chef cookbooks to install virtual machines for different purposes:

- Zend Server Community Edition with PHP 5.3 (Vagrantfile.zend-server-ce-php53)
- Zend Server Community Edition with PHP 5.4 (Vagrantfile.zend-server-ce-php54)

# Requirements

- VirtualBox [https://www.virtualbox.org]
- Vagrant [http://vagrantup.com]

# Installation

There is no default Vagrantfile. It has to be created and if required to be configured.

```
#
# Example for Zend Server Community Edition with PHP 5.4 (Vagrantfile.zend-server-ce-php54)
#

# Create a Vagrantfile by copy
cp Vagrantfile.zend-server-ce-php54 Vagrantfile

# Edit Vagrantfile to config the host name ($vm_host_name) or ip address ($vm_ip_address)
nano Vagrantfile
  ...
  $vm_host_name = "zsce54"
  $vm_ip_address = "192.168.100.11"
  ...

# Start Vagrant
vagrant up
```

After Vagrant has started successfully:

- adjust local SSH config

```
#
# Example for
# $vm_host_name = "zsce54"
# $vm_ip_address = "192.168.100.11"
#

nano ~/.ssh/config
...
Host default
  HostName 192.168.100.11
  Port 22
  User vagrant
  UserKnownHostsFile /dev/null
  StrictHostKeyChecking no
  PasswordAuthentication no
  IdentityFile ~/.vagrant.d/insecure_private_key
  IdentitiesOnly yes
  ...
```

- Connect to the VM with SSH
 - `ssh zsce54` (from everywhere within terminal) or
 - `vagrant ssh` (only within this project directory where the Vagrantfile is located)

- adjust local hosts file (`/etc/hosts`)

```
#
# Example for
# $vm_host_name = "zsce54"
# $vm_ip_address = "192.168.100.11"
#

sudo nano /etc/hosts
  ...
  192.168.100.11 zsce54
  ...
```

- Connect to the Zend Server GUI with HTTP
 - `http://zsce54:10081` or
 - `https://zsce54:10082`
