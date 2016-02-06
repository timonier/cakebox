FROM debian:jessie
MAINTAINER Morgan Auchede <morgan.auchede@gmail.com>

ENV \
    CA_CERTIFICATES_VERSION=20141019 \
    CAKEBOX_VERSION=1.8.3 \
    DEBIAN_FRONTEND=noninteractive \
    NGINX_VERSION=1.6.2 \
    PHP_VERSION=5.6.14 \
    PHP_JSON_VERSION=1.3.6

RUN set -x \

    # Prepare system

    && apt-get update \

    # Install packages

    && BUILD_DEPS="curl git npm" \
    && apt-get install -y --no-install-recommends \
           $BUILD_DEPS \
           ca-certificates=$CA_CERTIFICATES_VERSION* \
           nginx=$NGINX_VERSION* \
           php5-cli=$PHP_VERSION* \
           php5-common=$PHP_VERSION* \
           php5-curl=$PHP_VERSION* \
           php5-fpm=$PHP_VERSION* \
           php5-json=$PHP_JSON_VERSION* \
    && ln -s "$(which nodejs)" /usr/bin/node \
    && npm install -g \
           bower \
    && curl -sL "https://getcomposer.org/installer" | php -- --install-dir=/usr/bin \
    && mv /usr/bin/composer.phar /usr/bin/composer \

    # Install cakebox

    && git clone https://github.com/Cakebox/cakebox /var/www/cakebox \
    && git -C /var/www/cakebox checkout v$CAKEBOX_VERSION \
    && cd /var/www/cakebox \
    && composer install --no-dev --optimize-autoloader \
    && bower --allow-root install \

    # Configure nginx

    && ln -sf /dev/stdout /var/log/nginx/access.log \
    && ln -sf /dev/stderr /var/log/nginx/error.log \

    # Clean

    && apt-get remove -y --purge \
           $BUILD_DEPS \
    && apt-get autoremove -y --purge \
    && find . -type d -name ".git" | xargs rm -rf \
    && rm -rf \
           /root/.cache \
           /root/.config \
           /root/.composer \
           /root/.local \
           /root/.npm \
           /usr/bin/composer \
           /usr/bin/node \
           /usr/local/lib/* \
           /usr/share/nginx \
           /var/lib/apt/lists/* \
           /var/www/html

COPY ./root /

ENTRYPOINT [ "/entrypoint.sh" ]
