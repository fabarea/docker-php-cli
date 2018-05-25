FROM php:7.1-cli
MAINTAINER Fabien Udriot <fabien@omic.ch>

RUN apt-get update \
    && apt-get install -y \
        git \
        wget \
        unzip \
        rsync \
        openssh-client \
    && rm -rf /var/lib/apt/lists/*


RUN wget https://raw.githubusercontent.com/composer/getcomposer.org/master/web/installer -O - -q | php -- --filename=composer --install-dir=/usr/bin

RUN echo 'export PATH=~/.composer/vendor/bin:$PATH' >> ~/.bashrc
RUN composer global require "squizlabs/php_codesniffer=*"
RUN composer global require "hirak/prestissimo"
