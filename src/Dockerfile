FROM debian:jessie
MAINTAINER Morgan Auchede <morgan.auchede@gmail.com>

ENV \
    CAKEBOX_VERSION=1.8.6 \
    DEBIAN_FRONTEND=noninteractive \
    S6_OVERLAY_VERSION=1.17.1.2 \
    SYSLOG_STDOUT_VERSION=1.1.1

RUN set -x \

    # Prepare system

    && echo "deb http://nginx.org/packages/mainline/debian/ jessie nginx" >> /etc/apt/sources.list.d/nginx.list \
    && apt-key adv --keyserver hkp://pgp.mit.edu:80 --recv-keys 573BFD6B3D8FBC641079A6ABABF5BD827BD9BF62 \
    && apt-get update \

    # Install packages

    && BUILD_DEPS="curl git npm" \

    && apt-get install -y --no-install-recommends \
           $BUILD_DEPS \
           ca-certificates \
           nginx \
           php5-cli \
           php5-curl \
           php5-fpm \
           php5-json \

    && ln -s $(which nodejs) /usr/bin/node \

    && npm install -g \
           bower \

    && curl -sL "https://getcomposer.org/installer" | php -- --install-dir=/usr/bin \
    && mv /usr/bin/composer.phar /usr/bin/composer \

    # Install cakebox

    && rm -rf /var/www/* \
    && git clone https://github.com/Cakebox/cakebox /var/www \
    && git -C /var/www checkout v$CAKEBOX_VERSION \
    && sh -c "cd /var/www && composer install --no-dev --optimize-autoloader" \
    && sh -c "cd /var/www && bower --allow-root install" \

    # Install s6-overlay

    && curl -ksL "https://github.com/just-containers/s6-overlay/releases/download/v$S6_OVERLAY_VERSION/s6-overlay-amd64.tar.gz" | tar fxz - -C / \

    # Install syslog-stdout

    && curl -ksL "https://github.com/timonier/syslog-stdout/releases/download/v$SYSLOG_STDOUT_VERSION/syslog-stdout.tar.gz" | tar fxz - -C /usr/sbin \

    # Clean

    && apt-get remove -y --purge \
           $BUILD_DEPS \
    && apt-get autoremove -y --purge \

    && find . -type d -name ".git" | xargs rm -rf \
    && rm -rf \
           /etc/nginx/conf.d/default.conf \
           /root/.cache \
           /root/.config \
           /root/.composer \
           /root/.local \
           /root/.npm \
           /tmp/* \
           /usr/bin/composer \
           /usr/bin/node \
           /usr/local/lib/* \
           /usr/share/nginx \
           /var/lib/apt/lists/* \
           /var/www/.git \
           /var/www/html

COPY ./rootfs /

ENTRYPOINT [ "/init" ]
