#!/bin/bash
#add fix to exercise5-server2 here
sudo sed -i '$ a 192.168.100.10 server1 server1' /etc/hosts
sudo sed -i '$ a StrictHostKeyChecking no' /etc/ssh/ssh_config

# adding key of server1 to authosized key of server2
sudo cat /vagrant/id_rsa.pub >> ~/.ssh/authorized_keys

sudo sed -i 's/#PubkeyAuthentication yes/PubkeyAuthentication yes/g' /etc/ssh/sshd_config
sudo service sshd restart

#key creation on server 2
ssh-keygen -q -t rsa -N '' -f ~/.ssh/id_rsa <<<y >/dev/null 2>&1
#copy key of server2 to vagrant
sudo cp /home/vagrant/.ssh/id_rsa.pub /vagrant


