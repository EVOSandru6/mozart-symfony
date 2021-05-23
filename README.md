# Mozart symfony test project

## Docker

### Docker tricks

Start console script
```
sudo docker run --rm -v ${PWD}/manager:/app --workdir=/app php:8.0.6-cli ls
sudo docker run --rm -v ${PWD}/manager:/app --workdir=/app php:8.0.6-cli php bin/app.php
```

Start web script
```
sudo sudo docker run --rm -v ${PWD}/manager/public:/var/www/html -p 8080:80 php:8.0.6-apache
curl http://localhost:8080
```

Docker build
```
sudo docker build --file=manager/Dockerfile --tag manager-php-cli manager
sudo docker run --rm manager-php-cli
sudo docker run --rm manager-php-cli php bin/app.php
```

## Check ports
```
sudo apt install lsof
sudo lsof -i :80
```
