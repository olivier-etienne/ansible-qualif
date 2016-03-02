*************
* PREREQUIS *
*************

Serveur

	- Installer debian sur le serveur

Local

	- Installer ansible
		http://docs.ansible.com/ansible/intro_installation.html

	- Générez clefs privée/publique SSH (sans pass)
		ssh-keygen

	- Copier la clé publique sur les serveurs cibles (debug et qualif)
		ssh-copy-id -i ~/.ssh/id_rsa.pub qualif@xxx.xxx.xxx.xxx

	- Configurer le fichier hosts avec les bonnes adresses IP des serveurs

	- Tester que les serveurs soit bien accessible depuis ansible
		ansible all -m ping -u qualif
		ansible all -m ping -u debug

	- Editer les fichiers de conf ansible avec les bonnes informations

	- Assurer vous d'avoir une connection valide à internet sur les serveurs

	- Lancer le script de pre-installation des serveurs (commenter proxy / time si pas orange)
		ansible-playbook -i hosts preinstall.yml --ask-become-pass

	- Lancer le script d'installation du serveur debug
		ansible-playbook -i hosts debug.yml --ask-become-pass

	- Lancer le script d'installation du serveur debug
		ansible-playbook -i hosts qualif.yml --ask-become-pass

	- Lancer le script de récupération des données (si Orange)
		ansible-playbook -i hosts restore.yml --ask-become-pass
