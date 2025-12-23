#!/bin/bash
set -euxo pipefail

# Expand disk (Amazon Linux 2023)
growpart /dev/nvme0n1 4 || true
lvextend -l +50%FREE /dev/RootVG/rootVol || true
lvextend -l +50%FREE /dev/RootVG/varVol || true
xfs_growfs / || true
xfs_growfs /var || true

# Install Docker
dnf -y install dnf-plugins-core
dnf config-manager --add-repo https://download.docker.com/linux/rhel/docker-ce.repo
dnf install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

systemctl enable docker
systemctl start docker

usermod -aG docker ec2-user

# Install telnet (correct way)
dnf install -y telnet