#!/bin/bash
#add fix to exercise4-server2 here
sudo sed -i '$ a StrictHostKeyChecking no' /etc/ssh/ssh_config
sudo sed -i '$ a 192.168.100.10 server1 server1' /etc/hosts
sudo ssh server2
