dev-up:
	sudo docker network create app
	sudo docker run -d --name manager-php-fpm -v ${PWD}/manager:/app --network=app manager-php-fpm
	sudo docker run -d --name manager-nginx -v ${PWD}/manager:/app -p 8080:80 --network=app manager-nginx
	#sudo docker run -d --name manager-apache -v ${PWD}/manager:/app -p 8081:80 manager-apache

dev-down:
	sudo docker stop manager-nginx
	sudo docker stop manager-php-fpm
	sudo docker rm manager-nginx
	sudo docker rm manager-php-fpm
	sudo docker network remove app
	#sudo docker stop manager-apache
	#sudo docker rm manager-apache

dev-build:
	sudo docker build --file=manager/docker/development/nginx.docker --tag manager-nginx manager/docker/development
	sudo docker build --file=manager/docker/development/php-fpm.docker --tag manager-php-fpm manager/docker/development
	sudo docker build --file=manager/docker/development/php-cli.docker --tag manager-php-cli manager/docker/development
	#sudo docker build --file=manager/docker/development/apache.docker --tag manager-apache manager/docker/development

dev-cli:
	sudo docker run --rm -v ${PWD}/manager:/app manager-php-cli php bin/app.php

prod-up:
	sudo docker run -d --name manager-apache -p 8080:80 manager-apache

prod-build:
	sudo docker build --file=manager/docker/production/nginx.docker --tag manager-nginx manager
	sudo docker build --file=manager/docker/production/php-fpm.docker --tag manager-php-fpm manager
	sudo docker build --file=manager/docker/production/php-cli.docker --tag manager-php-cli manager
	#sudo docker build --file=manager/docker/production/apache.docker --tag manager-apache manager

prod-cli:
	sudo docker run --rm manager-php-cli php bin/app.php