*************
* PREREQUIS *
*************

Serveur

	- Installer debian sur le serveur
	- Créer un utilisateur qualif
		adduser qualif

Local

	- Installer ansible
		http://docs.ansible.com/ansible/intro_installation.html
	- Générez clefs privée/publique SSH (sans pass)
		ssh-keygen
	- Copier la clé publique sur les serveurs cibles (debug et qualif)
		ssh-copy-id -i ~/.ssh/id_rsa.pub qualif@xxx.xxx.xxx.xxx
	- Tester que les serveurs soit bien accessible depuis ansible
		ansible all -m ping -u qualif
		ansible all -m ping -u debug
	- Configurer le fichier hosts avec les bonnes adresses IP des serveurs
	- Assurer vous d'avoir un connection valide à internet sur les serveurs
	- Lancer le script de pre-installation des serveurs (commenter les rôles proxy et time si hors réseau orange)
		ansible-playbook -i hosts preinstall.yml --ask-become-pass
	- Lancer le script d'installtion du serveur debug
		ansible-playbook -i hosts debug.yml --ask-become-pass
	- Lancer le script d'installtion du serveur debug
		ansible-playbook -i hosts qualif.yml --ask-become-pass
