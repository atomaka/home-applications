include .env
export

deploy: validate
	scp ./*.env $$SERVER_IP:/home/atomaka/docker
	scp ./.env $$SERVER_IP:/home/atomaka/docker
	scp ./docker-compose.yml $$SERVER_IP:/home/atomaka/docker
	ssh $$SERVER_IP "cd /home/atomaka/docker && docker-compose up -d"

validate:
	docker-compose config > /dev/null
