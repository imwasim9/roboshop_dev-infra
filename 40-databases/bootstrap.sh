#!bin/bash
dnf install ansible -y
ansible-pull -U https://github.com/imwasim9/RoboshopAnsibleRoles-TF.git -e component=$component main.yaml