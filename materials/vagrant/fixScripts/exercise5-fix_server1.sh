#!/bin/bash
#add fix to exercise5-server1 here
sudo sed -i 's/#PubkeyAuthentication yes/PubkeyAuthentication yes/g' /etc/ssh/sshd_config
sudo service sshd restart
ssh-keygen -q -t rsa -N '' -f ~/.ssh/id_rsa1
sudo cp /home/vagrant/.ssh/id_rsa1.pub /vagrant
echo "Run script for server2"
sleep 30  
echo "all Done"
sudo cat /vagrant/id_rsa2.pub >> ~/.ssh/authorized_keys
