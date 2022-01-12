#!/bin/bash
#add fix to exercise5-server2 here
sudo sed -i 's/#PubkeyAuthentication yes/PubkeyAuthentication yes/g' /etc/ssh/sshd_config
sudo service sshd restart
ssh-keygen -q -t rsa -N '' -f ~/.ssh/id_rsa2 <<<y >/dev/null 2>&1
sudo cp /home/vagrant/.ssh/id_rsa2.pub /vagrant
sudo cat /vagrant/id_rsa1.pub >> ~/.ssh/authorized_keys
ssh server1
