*************
* PREREQUIS *
*************

Serveur

  - Installer debian sur le serveur
  - Installer sudo sur le serveur
    https://packages.debian.org/fr/jessie/amd64/sudo/download
  - Créer un utilisateur qualif
    adduser qualif && adduser qualif sudo


Local

	- Installer ansible
	- Générez clefs privée/publique SSH
	  ssh-keygen
	- Copier la clé publique sur le serveur
	  ssh-copy-id -i ~/.ssh/id_rsa.pub qualif@xxx.xxx.xxx.xxx
	- Créer le fichier /etc/ansible/hosts en entrer l'adresse ip du serveur
	- Tester que le serveur soit bien accessible depuis ansible
	  ansible all -m ping -u qualif
