FROM ubuntu:24.04
ARG DEBIAN_FRONTEND=noninteractive
RUN  apt update --fix-missing -y && apt upgrade -y


RUN apt install -y apt-utils git rsync nano vim unzip curl wget software-properties-common git
RUN LC_ALL=C.UTF-8 add-apt-repository -y ppa:ondrej/php


RUN apt-get install -y sudo apache2 php8.3 php8.3-common php8.3-cli php8.3-gd php8.3-mysql php8.3-mbstring php8.3-bcmath php8.3-xml php8.3-fpm php8.3-curl php8.3-zip libapache2-mod-php8.3

ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2
RUN rm /var/www/html/*
RUN rm /etc/apache2/sites-enabled/000-default.conf
COPY frontend.conf /etc/apache2/sites-enabled/frontend.conf

COPY wwwdata/. /var/www/html
RUN chown www-data:www-data -R /var/www/html/*

RUN sed -i 's/<backend_domain>/backend_domain_here/g' /var/www/html/main-ZKT6JCA3.js

RUN a2enmod rewrite headers
RUN service apache2 restart
WORKDIR /var/www/html/
EXPOSE 80
CMD ["apache2ctl", "-D", "FOREGROUND"]