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


# zip
#RUN docker-php-ext-install zip

RUN wget https://raw.githubusercontent.com/composer/getcomposer.org/1b137f8bf6db3e79a38a5bc45324414a6b1f9df2/web/installer -O - -q | php -- --filename=composer --install-dir=/usr/bin

RUN echo 'export PATH=~/.composer/vendor/bin:$PATH' >> ~/.bashrc
RUN composer global require "squizlabs/php_codesniffer=*"
RUN composer global require "hirak/prestissimo"