#!/bin/bash

printf "destroying vagrant VM...\n"
sh -c 'vagrant destroy -f'

for host in 10.10.10.2 10.10.10.3 10.10.10.4 10.10.10.5 vm1 vm2 vm3 vm4; do
	ssh-keygen -R $host
done

rm -rf $HOME/.ssh/known_hosts.old
printf "creating vagrant VM...\n"
sh -c 'vagrant up'

for host in 10.10.10.2 10.10.10.3 10.10.10.4 10.10.10.5 vm1 vm2 vm3 vm4; do
	ssh-keyscan -t ecdsa-sha2-nistp256 $host >> $HOME/.ssh/known_hosts
done
