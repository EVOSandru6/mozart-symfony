dev-up:
	sudo docker run -d --name manager-apache -v ${PWD}/manager:/app -p 8081:80 manager-apache

dev-down:
	sudo docker stop manager-apache
	sudo docker rm manager-apache

dev-build:
	sudo docker build --file=manager/docker/development/php-cli.docker --tag manager-php-cli manager/docker/development
	sudo docker build --file=manager/docker/development/apache.docker --tag manager-apache manager/docker/development

dev-cli:
	sudo docker run --rm -v ${PWD}/manager:/app manager-php-cli php bin/app.php

prod-up:
	sudo docker run -d --name manager-apache -p 8080:80 manager-apache

prod-build:
	sudo docker build --file=manager/docker/production/php-cli.docker --tag manager-php-cli manager
	sudo docker build --file=manager/docker/production/apache.docker --tag manager-apache manager

prod-cli:
	sudo docker run --rm manager-php-cli php bin/app.php