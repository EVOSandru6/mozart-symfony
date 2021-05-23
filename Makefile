dev-build:
	sudo docker build --file=manager/docker/development/php-cli.docker --tag manager-php-cli manager/docker/development
dev-cli:
	sudo docker run --rm -v ${PWD}/manager:/app manager-php-cli php bin/app.php

prod-build:
	sudo docker build --file=manager/docker/production/php-cli.docker --tag manager-php-cli manager
prod-cli:
	sudo docker run --rm manager-php-cli php bin/app.php

#cli: todo холостой запуск
#	sudo docker run --rm -v ${PWD}/manager:/app --workdir=/app php:8.0.6-cli php bin/app.php
