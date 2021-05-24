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

Before deploy production
```
REGISTRY_ADDRESS=registry IMAGE_TAG=0 make build-production
```

Install slim into cli container
```
sudo docker-compose run --rm manager-php-cli composer require slim/slim
```

### Docker install
```sudo apt-get remove -y docker docker-engine docker.io containerd runc;```

```sudo apt-get update;```

```
sudo apt-get install -y \
 apt-transport-https \
 ca-certificates \
 curl \
 gnupg-agent \
 software-properties-common;
```
 
```
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -;
```
```
sudo apt-key fingerprint 0EBFCD88;
```

```
sudo add-apt-repository \
 "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
 $(lsb_release -cs) \
 stable";
```

``` 
sudo apt-get update;
sudo apt-get install -y docker-ce docker-ce-cli containerd.io;
```

```
sudo curl -L "https://github.com/docker/compose/releases/download/1.25.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose;
```
```
sudo chmod +x /usr/local/bin/docker-compose;
```
```
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose;
```

rules for user
```
sudo groupadd docker;
sudo usermod -aG docker $USER;
sudo newgrp docker;
sudo reboot;
```


## Check ports
```
sudo apt install lsof
sudo lsof -i :80
```

