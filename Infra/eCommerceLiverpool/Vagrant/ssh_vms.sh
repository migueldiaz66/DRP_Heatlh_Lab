#!/bin/bash

# Defines terminal color escape sequence for 
# catching better atention of the user
BLACK='\033[30;30m'    
DARK_GRAY='\033[1;30m'
RED='\033[0;31m'     
LIGHT_RED='\033[1;31m'
GREEN='\033[0;32m'     
LIGHT_GREEN='\033[1;32m'
BROWN_ORANGE='\033[0;33m'     
YELLOW='\033[1;33m'
BLUE='\033[0;34m'     
LIGHT_BLUE='\033[1;34m'
PURPLE='\033[0;35m'     
LIGHT_PURPLE='\033[1;35m'
CYAN='\033[0;36m'     
LIGHT_CYAN='\033[1;36m'
LIGHT_GRAY='\033[0;37m'     
WHITE='\033[1;37m'
NC='\033[0m' # No Color

# Function for printing the welcome message to the user
say_hello()
{
  echo -e "${LIGHT_GREEN}"
  echo -e "----------------------------------------------"
  echo -e "-         Vagrant Machine Lister Tool        -"
  echo -e "-                                            -"
  echo -e "- Pick a number from the list and you are in -"
  echo -e "-                                            -"
  echo -e "-        Miguel Jesús Díaz Macedo            -"
  echo -e "-         webmaster@12factor.mx              -"
  echo -e "-                                            -"
  echo -e "-    The source code of this tool is at      -"
  echo -e "-${YELLOW}      https://github.com/12Factor-mx${LIGHT_GREEN}        -"
  echo -e "-                                            -"
  echo -e "-          Enjoy as much as I did!           -"
  echo -e "----------------------------------------------${NC}"
}

# Function for printing the farewell message to the user
say_bye()
{
  echo -e "${LIGHT_GREEN}"
  echo -e "Thanks for using this tool." 
  echo -e "Comments welcome at ${LIGHT_BLUE}webmaster@12factor.mx ${LIGHT_GREEN}and"
  echo -e "don't forget to visit ${YELLOW}www.12factor.mx"
  echo -e "${LIGHT_GREEN}The source code of this tool is at ${LIGHT_PURPLE}https://github.com/12Factor-mx"
  echo -e "${NC}"
}

# Function for printing a sort of error message to the user
# in case the .vagarant folder is empty or does not exists
say_no_machines()
{
  echo -e "${NC}"
  echo -e "${RED}Sorry but no machines found."
  echo -e "Have you tried Vagrant init or Vagrant up?${NC}"
}

# Caugth temination signal <ctrl-c> and prints the
# shell cancelation intend message
trap 'echo -e "${NC}"; 
      echo -e "\n${BLUE}Ok, you are the Boss! quiting because a ^C was been issued...${NC}"; 
      say_bye; 
      exit'  SIGINT SIGTERM

say_hello

# Assumes this shell runs in the VAGRANT_HOME directory
if [[ -z "${VAGRANT_HOME}" ]]; then
  VAGRANT_HOME="." 
fi

# Global variables
let "selection=1" # index for the vagrant_machines array

# Read the vagant machines names from the .vagrant folder
vagrant_machines=($(ls $VAGRANT_HOME/.vagrant/machines 2> /dev/null | xargs -n 1 basename 2> /dev/null)) 

# If .vagarant file is empty o neither exits 
# say goodbye and quit 
if [[ -z $vagrant_machines ]]; then
  say_no_machines
  say_bye
  exit
fi

# Very good we have the machine names now ...
# Prints the header list to the user
echo -e "${LIGHT_PURPLE}"
echo -e "List of machines found:"
echo -e ""
# Prints the machine list to the user
for i in "${vagrant_machines[@]}"
do
   echo -e  $selection")" $i
   ((selection++))
done

# Prompts the user to select the machine she/he wants to shh into
echo -e ""
read -p "Select the machine you want to ssh into: " selection_input
echo -e "${NC}"

# Once the user has selected a machine lets shh into. 
# If the selection does not mach a index in de array the ssh command will fail
# Becuase the selection list starts with 1 and the array starts at 0 we must decrement the selection_input variable by 1

# CD to the working directory and executes the ssh command 
# against the selected server
cd $VAGRANT_HOME
vagrant ssh ${vagrant_machines[((--selection_input))]}

# We are done, thanks!
say_bye


