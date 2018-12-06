FROM ubuntu

MAINTAINER Rich Shillingford 

COPY ./php.conf /etc/nginx/sites-enabled/
COPY ./info.php /www/sites/php/
COPY ./php.ini /etc/php/7.2/fpm/php.ini

RUN apt-get update \
    && apt-get install nginx -y \
    && apt-get install php-fpm -y \
    && apt-get install supervisor -y \
    && mkdir -p /run/php

COPY ./www.conf /etc/php/7.2/fpm/pool.d/
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

CMD ["/usr/bin/supervisord"]
