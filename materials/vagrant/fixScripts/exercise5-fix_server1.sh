#!/bin/bash
#add fix to exercise5-server1 here
sudo sed -i '$ a 192.168.100.11 server2 server2' /etc/hosts
sudo sed -i '$ a StrictHostKeyChecking no' /etc/ssh/ssh_config
sudo sed -i 's/#PubkeyAuthentication yes/PubkeyAuthentication yes/g' /etc/ssh/sshd_config
sudo service sshd restart

#keys creation server1
ssh-keygen -q -t rsa -N '' -f ~/.ssh/id_rsa <<<y >/dev/null 2>&1

#copy key to vagrant 
sudo cp /home/vagrant/.ssh/id_rsa.pub /vagrant
echo "Sleep for 1 minutes to complete running of execise5-fix_server2.sh"
sleep 2m  
echo "Sleep completed, updating autorize key on server1"
#run folloing command on server1 
sudo cat /vagrant/id_rsa.pub >> ~/.ssh/authorized_keys
