FROM ubuntu:latest

# Update & install SSH
RUN apt-get update && apt-get install -y --no-install-recommends apt-utils
RUN apt install openssh-server -y

# Install CURL
RUN apt-get install curl -y

# Install PHP
RUN apt -y install software-properties-common
RUN add-apt-repository ppa:ondrej/php -y
ENV TZ=Europe/Warsaw
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt-get -y install php7.4

RUN apt-get -y install php-curl php-mbstring php-zip zip unzip

# Install Composer
RUN curl --silent --show-error https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN apt-get install -y

## Install Laravel Envoy
RUN composer global require laravel/envoy
