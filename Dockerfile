FROM arm32v7/alpine:latest

LABEL maintainer "ueniueni, ueni"

COPY qemu-arm-static /usr/bin

RUN apk add --update --no-cache php7 php7-fpm php7-cgi php7-common php7-sqlite3 php7-gd

RUN sed -i '/^listen /s/=.*$/= 0.0.0.0:9000/' /etc/php7/php-fpm.d/www.conf

VOLUME /etc/php7
VOLUME /var/run/php7-fpm.sock

EXPOSE 9000

CMD ["php-fpm7", "-F"]
