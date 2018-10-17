# Quick Description

## Use case

A Vagrant user needs to ssh into just one Vagrant machine over a large list of machines.

## Trys to solve

This small shell tool could be usefull in cases where the list of machines is extensive and hard to remember

## Description

This shell gives the user a small UI for ssh into vagrant machines.
It pretends to help the user in the selection of one machine from a list (maybe a large one) of machine and automatically ssh into selected machine

## Prerequisites

 1. Bash shell (tested only with bash)
 2. A Vagrant project folder (VAGRANT_HOME) already initialized with:

    ```bash
    vagrant init
    ```
 3. A Vagrant project with a valid Vagrant file
 4. A Vagrant project folder (VAGRANT_HOME) already up and provisioned with:

    ```bash
    vagrant up
    ```

For more details take a look at <https://www.vagrantup.com/docs/index.html> on how to put up & running a Vagrant environment

## Install

Copy or download or clone this shell into your VAGRANT_HOME proyect

## Run

Start a Bash shell and cd into your VAGRANT_HOME project
Once there execute the shell as

```bash
./ssh_vms.sh
```

## Enjoy '!'

Any comment, issue, or requirment are welcome at the github public repo <https://github.com/12Factor-mx/lazy-vagrant-ssh>