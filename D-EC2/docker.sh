#!/bin/bash

echo "docker.sh started running"

growpart /dev/nvme0n1 4
lvextend -l +50%FREE /dev/RootVG/rootVol
lvextend -l +50%FREE /dev/RootVG/varVol
xfs_growfs /
xfs_growfs /var

echo "partition is done successfully"

sudo dnf -y install dnf-plugins-core
echo "dnf -y install dnf-plugins-core is done successfully"

sudo dnf config-manager --add-repo https://download.docker.com/linux/rhel/docker-ce.repo
echo "config-manager is done successfully"

sudo dnf install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y
echo "docker install is done successfully"

sudo systemctl start docker
sudo systemctl enable docker
sudo usermod -aG docker ec2-user

echo "Docker installed successfully"
echo "please logout and login again"