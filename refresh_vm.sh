#!/bin/bash

printf "destroying vagrant VM...\n"
sh -c 'vagrant destroy -f'
ssh-keygen -R [127.0.0.1]:2222
ssh-keygen -R [127.0.0.1]:2200
ssh-keygen -R [127.0.0.1]:2201

for host in 10.10.10.2 10.10.10.3 10.10.10.4 vm1 vm2 vm3; do
	ssh-keygen -R $host
done

rm -rf $HOME/.ssh/known_hosts.old
printf "creating vagrant VM...\n"
sh -c 'vagrant up'

for host in 10.10.10.2 10.10.10.3 10.10.10.4 vm1 vm2 vm3; do
	ssh-keyscan -t rsa $host >> $HOME/.ssh/known_hosts
done