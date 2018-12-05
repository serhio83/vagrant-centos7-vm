#!/bin/bash

HOSTNAME='10.10.10.2'

printf "destroying vagrant VM...\n"
sh -c 'vagrant destroy -f'
ssh-keygen -R $HOSTNAME
rm -rf $HOME/.ssh/known_hosts.old
printf "creating vagrant VM...\n"
sh -c 'vagrant up'
ssh-keyscan -t ecdsa-sha2-nistp256 $HOSTNAME >> $HOME/.ssh/known_hosts
