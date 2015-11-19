FROM debian:jessie
MAINTAINER Morgan Auchede <morgan.auchede@gmail.com>

ENV \
    CA_CERTIFICATES_VERSION=20141019 \
    CAKEBOX_VERSION=1.8.3 \
    NGINX_VERSION=1.6.2 \
    PHP_VERSION=5.6.14 \
    PHP_JSON_VERSION=1.3.6

RUN set -x \
    && BUILD_DEPS="curl git npm" \
    && apt-get update \
    && apt-get install -y --no-install-recommends \
        $BUILD_DEPS \
        ca-certificates=$CA_CERTIFICATES_VERSION* \
        nginx=$NGINX_VERSION* \
        php5-cli=$PHP_VERSION* php5-curl=$PHP_VERSION* php5-fpm=$PHP_VERSION* php5-json=$PHP_JSON_VERSION* \
    && ln -sf /dev/stdout /var/log/nginx/access.log \
    && ln -sf /dev/stderr /var/log/nginx/error.log \
    && npm install -g bower \
    && ln -s "$(which nodejs)" /usr/bin/node \
    && curl -sS https://getcomposer.org/installer | php \
    && mv composer.phar /usr/local/bin/composer \
    && git clone https://github.com/Cakebox/cakebox /var/www/cakebox \
    && git -C /var/www/cakebox checkout v$CAKEBOX_VERSION \
    && cd /var/www/cakebox \
    && composer install --no-dev --optimize-autoloader \
    && bower --allow-root install \
    && apt-get remove -y --purge $BUILD_DEPS \
    && apt-get autoremove -y --purge \
    && find . -type d -name ".git" | xargs rm -rf \
    && rm -rf /root/.cache /root/.config /root/.composer /root/.local /root/.npm /usr/bin/node /usr/local/bin/* /usr/local/lib/* /usr/share/nginx /var/lib/apt/lists/* /var/www/html

COPY cakebox /var/www/cakebox
COPY nginx /etc/nginx
COPY php /etc/php5
COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]
