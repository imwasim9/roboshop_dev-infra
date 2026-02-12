#!/bin/bash
sudo yum install -y yum utils
sudo yum-config-manager --add-repo https://rpm.release.hashicorp.com/RHEL/hashicorp.repo
sudo yum -y install terraform