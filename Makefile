restart:
	vagrant halt && vagrant destroy -f && vagrant up && ssh-keygen && ssh-copy-id -i ~/.ssh/id_rsa.pub vagrant@master && ssh-copy-id -i ~/.ssh/id_rsa.pub vagrant@worker

stop:
	vagrant halt && vagrant destroy -f

status:
	vagrant status

edit-hosts:
	sudo nano /etc/hosts

edit-ansible-hosts:
	sudo nano /etc/ansible/hosts

edit-known-hosts:
	sudo nano /Users/${USER}/.ssh/known_hosts

ssh-keygen:
	ssh-keygen

ssh-copy-id:
	ssh-copy-id -i ~/.ssh/id_rsa.pub vagrant@master && ssh-copy-id -i ~/.ssh/id_rsa.pub vagrant@worker

ssh-master:
	ssh vagrant@master

ssh-worker:
	ssh vagrant@worker

ping:
	ansible master -m ping && ansible worker -m ping && ansible-playbook playbooks/ping.yml