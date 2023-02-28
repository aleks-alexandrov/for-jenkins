FROM wordpress:php7.4-fpm-alpine

ARG build
ARG commit
ARG ts

RUN touch /var/www/html/version.txt
RUN echo "Build: ${build}" >> /var/www/html/version.txt
RUN echo "Commit: ${commit}" >> /var/www/html/version.txt
RUN echo "Timestamp: ${ts}" >> /var/www/html/version.txt
