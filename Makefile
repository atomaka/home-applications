deploy: validate
	scp ./*.env 192.168.1.20:/home/atomaka/docker
	scp ./docker-compose.yml 192.168.1.20:/home/atomaka/docker
	ssh 192.168.1.20 "cd /home/atomaka/docker && docker-compose up -d"

validate:
	docker-compose config > /dev/null
