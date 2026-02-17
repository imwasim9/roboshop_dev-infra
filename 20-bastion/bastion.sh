#!/bin/bash

# growing thr /home volume for terraform as the provider takes 1GB
growpart /dev/nvme0n1 4
lvextend -L +30G /dev/mapper/RootVG-homeVol
xfs_growfs /home

sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo
sudo yum -y install terraform

# creating databases
cd /home/ec2-user
git clone https://github.com/imwasim9/roboshop_dev-infra.git
chown ec2-user:ec2-user -R roboshop_dev-infra
cd roboshop_dev-infra/40-databases
terraform init
terraform apply -auto-approve