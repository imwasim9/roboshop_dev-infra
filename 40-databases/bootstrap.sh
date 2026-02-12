#!bin/bash
component=$1
env=$2
dnf install ansible -y
# ansible-pull -U https://github.com/imwasim9/RoboshopAnsibleRoles-TF.git -e component=$component main.yaml
# git clone ansible-playbook
# cd ansible-playbook
# ansible-playbook -i inventory main.yaml

REPO_URL=https://github.com/imwasim9/RoboshopAnsibleRoles-TF.git
REPO_DIR=/opt/roboshop/ansible
ANSIBLE_DIR=RoboshopAnsibleRoles-TF

mkdir -p $REPO_DIR
mkdir -p /var/log/roboshop
touch ansible.log

cd $REPO_DIR

#check if ansible repo is already cloned or not
if [-d $ANSIBLE_DIR]; then
    cd $ANSIBLE_DIR
    git pull
else 
    git clone $REPO_URL
    cd $ANSIBLE_DIR
fi

ansible-playbook -e component=$component -e environment=$env main.yaml
