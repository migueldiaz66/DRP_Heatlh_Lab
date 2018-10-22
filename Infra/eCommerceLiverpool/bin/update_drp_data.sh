#!/bin/bash

ansible-playbook -i /home/mdiazm/DRP_Heatlh_Lab/Infra/eCommerceLiverpool/Vagrant/.vagrant/provisioners/ansible/inventory/ ../Ansible/playbooks/verify_weblogic_servers_health.yml
ansible-playbook -i /home/mdiazm/DRP_Heatlh_Lab/Infra/eCommerceLiverpool/Vagrant/.vagrant/provisioners/ansible/inventory/ ../Ansible/playbooks/update_weblogic_servers_parents.yml
ansible-playbook -i /home/mdiazm/DRP_Heatlh_Lab/Infra/eCommerceLiverpool/Vagrant/.vagrant/provisioners/ansible/inventory/ ../Ansible/playbooks/update_weblogic_parents.yml
ansible-playbook -i /home/mdiazm/DRP_Heatlh_Lab/Infra/eCommerceLiverpool/Vagrant/.vagrant/provisioners/ansible/inventory/ ../Ansible/playbooks/update_ecommerce_parents.yml

