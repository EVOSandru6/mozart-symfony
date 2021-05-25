up: docker-up
init: docker-down-clear docker-pull docker-build docker-up manager-init

docker-up:
	sudo docker-compose up -d

docker-down:
	sudo docker-compose down --remove-orphans

docker-down-clear:
	sudo docker-compose down -v --remove-orphans

docker-pull:
	sudo docker-compose pull

docker-build:
	sudo docker-compose build

manager-init: manager-composer-install

manager-composer-install:
	sudo docker-compose run --rm manager-php-cli composer install

cli:
	sudo docker-compose run --rm manager-php-cli php bin/app.php

build-production:
	sudo docker --pull --file=manager/docker/nginx.docker --tag ${REGISTRY_ADDRESS}/manager-nginx:${IMAGE_TAG} manager
	sudo docker --pull --file=manager/docker/php-fpm.docker --tag ${REGISTRY_ADDRESS}/manager-php-fpm:${IMAGE_TAG} manager
	sudo docker --pull --file=manager/docker/php-cli.docker --tag ${REGISTRY_ADDRESS}/manager-php-cli:${IMAGE_TAG} manager

push-production:
	sudo docker push ${REGISTRY_ADDRESS}/manager-nginx:${IMAGE_TAG}
	sudo docker push ${REGISTRY_ADDRESS}/manager-php-fpm:${IMAGE_TAG}
	sudo docker push ${REGISTRY_ADDRESS}/manager-php-cli:${IMAGE_TAG}

deploy-production:
	ssh ${PRODUCTION_HOST} -p ${PRODUCTION_PORT} 'rm -rf docker-compose.yml .env'
	scp -P ${PRODUCTION_PORT} docker-compose.yml ${PRODUCTION_HOST}:docker-compose.yml
	ssh ${PRODUCTION_HOST} -p ${PRODUCTION_PORT} 'echo "REGISTRY_ADDRESS=${REGISTRY_ADDRESS}" >> .env'
	ssh ${PRODUCTION_HOST} -p ${PRODUCTION_PORT} 'docker-compose pull'
	ssh ${PRODUCTION_HOST} -p ${PRODUCTION_PORT} 'docker-compose build -d'



