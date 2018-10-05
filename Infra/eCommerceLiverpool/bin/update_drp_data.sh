#!/bin/bash

ansible-playbook -i /home/mdiazm/DRP_Heatlh_Lab/Infra/eCommerceLiverpool/Vagrant/.vagrant/provisioners/ansible/inventory/ ../Ansible/playbooks/verify_weblogic_servers_health.yml

