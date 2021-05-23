cli:
	sudo docker run --rm -v ${PWD}/manager:/app --workdir=/app php:8.0.6-cli php bin/index.php
