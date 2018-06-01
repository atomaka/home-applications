deploy: validate files
	scp ./*.env 192.168.1.20:/home/atomaka/docker
	scp ./docker-compose.yml 192.168.1.20:/home/atomaka/docker
	ssh 192.168.1.20 "cd /home/atomaka/docker && docker-compose up -d"

files:
	scp ./nginx.tmpl 192.168.1.20:/home/atomaka
	ssh 192.168.1.20 "sudo mv /home/atomaka/nginx.tmpl /mnt/data/docker/nginx/templates/"
	scp ./nginx.template.conf 192.168.1.20:/home/atomaka
	ssh 192.168.1.20 "sudo mv /home/atomaka/nginx.template.conf /mnt/data/docker/haproxy/"
	scp ./nginx.template.conf 192.168.1.20:/home/atomaka
	ssh 192.168.1.20 "sudo mv /home/atomaka/nginx.template.conf /mnt/data/docker/hadashboardproxy/"

network:
	ssh 192.168.1.20 "docker network create nginx-proxy"

validate:
	docker-compose config > /dev/null
