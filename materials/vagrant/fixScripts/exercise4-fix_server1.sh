#!/bin/bash
#add fix to exercise4-server1 here
sudo sed -i '$ a 192.168.100.11 server2 server2' /etc/hosts
sudo sed -i '$ a StrictHostKeyChecking no' /etc/ssh/ssh_config
sudo ssh server
