#!/bin/bash

printf "destroying vagrant VM...\n"
sh -c 'vagrant destroy -f'
ssh-keygen -R vm1
ssh-keygen -R vm2
rm -rf $HOME/.ssh/known_hosts.old
printf "creating vagrant VM...\n"
sh -c 'vagrant up'
ssh-keyscan -t rsa vm1 >> $HOME/.ssh/known_hosts
ssh-keyscan -t rsa vm2 >> $HOME/.ssh/known_hosts
