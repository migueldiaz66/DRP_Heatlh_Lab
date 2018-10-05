#!/bin/bash

clear

let "selection=1"
vagrant_servers=($(ls /home/mdiazm/DRP_Heatlh_Lab/Infra/eCommerceLiverpool/Vagrant/.vagrant/machines | xargs -n 1 basename))

echo "Servers:"
echo ""
for i in "${vagrant_servers[@]}"
do
   echo  $selection")" $i
   ((selection++))
done

echo ""
read -p "Select the server to ssh into: " selection_input
#((line--))

cd /home/mdiazm/DRP_Heatlh_Lab/Infra/eCommerceLiverpool/Vagrant
vagrant ssh ${vagrant_servers[((--selection_input))]}


