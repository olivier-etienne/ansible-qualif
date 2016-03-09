################
# Servers side #
################

	- Install debian jessie on both qualif and debug bench

	- Make sure an user called "qualif" is created
		adduser qualif

	- Reboot both qualif and debug bench


##############
# Local side #
##############

	- Install ansible
		http://docs.ansible.com/ansible/intro_installation.html

	- Generate SSH key
		ssh-keygen

	- Connect qualif/debug bench and your local PC to a valid internet network (without proxy)

	- Copy public SSH key content to qualif/debug bench
		ssh-copy-id -i ~/.ssh/id_rsa.pub qualif@xxx.xxx.xxx.xxx

	- Edit first row of [debug] / [qualif] group in ansible host file with correct IP address (internet)

	- Edit groups_var/all.yml file with correct information

	- Run the preinstall script (comment proxy role if your network does not have proxy)
		ansible-playbook -i hosts preinstall.yml --ask-become-pass

	- Connect qualif/debug bench and your local PC to your internal network

	- As IP address changed, copy again public SSH key content to qualif/debug bench
		ssh-copy-id -i ~/.ssh/id_rsa.pub qualif@xxx.xxx.xxx.xxx

	- Edit second row of [debug] / [qualif] group in ansible host file with correct IP address (internal)

	- Run the debug script to install debug bench (set restore_nas to false if no nas available)
		ansible-playbook -i hosts debug.yml --ask-become-pass
	  Then enter the root password

	- Run the qualif script to install qualif bench  (set restore_nas to false if no nas available)
		ansible-playbook -i hosts qualif.yml --ask-become-pass
	  Then enter the root password

	- Reboot debug / qualif bench
	    shutdown -r now
