#!/bin/bash


clear
echo "install subversion"
sudo apt-get install subversion

echo "install tree"
sudo apt-get install tree

echo "Make a Directory for SVN "
sudo mkdir svnrepo

echo "create Repo with svnadmin "
sudo svnadmin create svnrepo

echo "edit configuration file svnserve.conf to give permission to write"
sudo gedit svnrepo/conf/svnserve.conf

echo "create Usre and password..."
sudo gedit svnrepo/conf/passwd

echo "create user Group"
sudo groupadd svngroup

echo "Create user and its group"
sudo useradd svnfadi -g svngroup

echo "set password for the user svnfadi"
sudo passwd svnfadi

echo "Change the owner of the repository"
sudo chown -R svnfadi:svngroup svnrepo


echo "change permission for repository"
sudo chmod -R 770 svnrepo

echo "check permissions"
sudo tree -C -A -p -u  -g svnrepo

echo "Execute SVN service"
sudo -u svnfadi svnserve -d -r svnrepo

echo "Check if it is running"
sudo apt install net-tools
netstat -l -t -p | grep -e PID -e svn


sleep 2

