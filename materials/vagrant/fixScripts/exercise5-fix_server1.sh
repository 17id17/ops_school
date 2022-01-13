#!/bin/bash
#add fix to exercise5-server1 here
#sudo sed -i 's/#PubkeyAuthentication yes/PubkeyAuthentication yes/g' /etc/ssh/sshd_config
#sudo service sshd restart
#keys creation server1
ssh-keygen -q -t rsa -N '' -f ~/.ssh/id_rsa <<<y >/dev/null 2>&1
#copy key to vagrant 
sudo cp /home/vagrant/.ssh/id_rsa.pub /vagrant
echo "Sleep of 2 minutes to complete running of execise5-fix_server2.sh or you can use ctrl+c to exit"
sleep 2m  
echo "Sleep completed"
#run folloing command on server1 
sudo cat /vagrant/id_rsa.pub >> ~/.ssh/authorized_keys


