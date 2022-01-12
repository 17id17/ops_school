#!/bin/bash
#add fix to exercise2 here
sudo sed -i 's/127.0.0.1 www.ascii-art.de/#127.0.0.1 www.ascii-art.de/g' /etc/hosts
curl http://www.ascii-art.de/ascii/ab/007.txt
