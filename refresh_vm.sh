#!/bin/bash

printf "destroying vagrant VM...\n"
sh -c 'vagrant destroy -f'
ssh-keygen -R vm1
rm -rf $HOME/.ssh/known_hosts.old
printf "creating vagrant VM...\n"
sh -c 'vagrant up'
ssh-keyscan -t ecdsa-sha2-nistp256 'vm1,10.10.10.2' >> $HOME/.ssh/known_hosts
