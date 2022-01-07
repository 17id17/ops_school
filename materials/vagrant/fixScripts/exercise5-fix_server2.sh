#!/bin/bash
#add fix to exercise5-server2 here
sudo sed -i '$ a 192.168.100.10 server1 server1' /etc/hosts
sudo sed -i '$ a StrictHostKeyChecking no' /etc/ssh/ssh_config
sudo sed -i 's/#PubkeyAuthentication yes/PubkeyAuthentication yes/g' /etc/ssh/sshd_config
sudo service sshd restart
ssh-keygen -q -t rsa -N '' -f ~/.ssh/id_rsa
sudo cat /vagrant/id_rsa_server1.pub >> ~/.ssh/authorized_keys
