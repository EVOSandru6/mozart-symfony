dev-up:
	sudo docker run -d --name manager-apache -v ${PWD}/manager:/app -p 8080:80 manager-apache
dev-down:
	sudo docker stop manager-apache
	sudo docker rm manager-apache
dev-build:
	sudo docker build --file=manager/docker/development/php-cli.docker --tag manager-php-cli manager/docker/development
	sudo docker build --file=manager/docker/development/apache.docker --tag manager-apache manager/docker/development
dev-cli:
	sudo docker run --rm -v ${PWD}/manager:/app manager-php-cli php bin/app.php

prod-up:
	sudo docker run -d manager-apache -p manager-apache
prod-build:
	sudo docker build --file=manager/docker/production/php-cli.docker --tag manager-php-cli manager
	sudo docker build --file=manager/docker/production/apache.docker --tag manager-apache manager
prod-cli:
	sudo docker run --rm manager-php-cli php bin/app.php

#cli: todo холостой запуск
#	sudo docker run --rm -v ${PWD}/manager:/app --workdir=/app php:8.0.6-cli php bin/app.php
