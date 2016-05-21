FROM debian:jessie
MAINTAINER Morgan Auchede <morgan.auchede@gmail.com>

ENV \
    CAKEBOX_VERSION=1.8.6 \
    S6_OVERLAY_VERSION=1.17.1.2 \
    SYSLOG_STDOUT_VERSION=1.1.1

RUN set -x \

    # Prepare system

    && export DEBIAN_FRONTEND=noninteractive \

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

    # Configure nginx

    && mkdir -p /var/tmp/nginx \
    && chown www-data:www-data /var/tmp/nginx \

    # Install cakebox

    && git clone https://github.com/Cakebox/cakebox /usr/share/cakebox \
    && git -C /usr/share/cakebox checkout v$CAKEBOX_VERSION \
    && composer install --no-dev --optimize-autoloader --working-dir /usr/share/cakebox \
    && sh -c "cd /usr/share/cakebox && bower --allow-root install" \

    # Install s6-overlay

    && curl -sL "https://github.com/just-containers/s6-overlay/releases/download/v$S6_OVERLAY_VERSION/s6-overlay-amd64.tar.gz" | tar fxz - -C / \

    # Install syslog-stdout

    && curl -sL "https://github.com/timonier/syslog-stdout/releases/download/v$SYSLOG_STDOUT_VERSION/syslog-stdout.tar.gz" | tar fxz - -C /usr/sbin \

    # Clean

    && apt-get remove -y --purge \
           $BUILD_DEPS \
    && apt-get autoremove -y --purge \

    && rm -rf \
           /etc/nginx/conf.d/default.conf \
           /etc/php5/fpm/pool.d/www.conf \
           /root/.cache \
           /root/.config \
           /root/.composer \
           /root/.local \
           /root/.npm \
           /tmp/* \
           /usr/bin/composer \
           /usr/bin/node \
           /usr/local/lib/* \
           /usr/share/cakebox/.git \
           /usr/share/cakebox/config/default.php.dist \
           /usr/share/nginx \
           /var/lib/apt/lists/*

COPY ./rootfs /

ENTRYPOINT [ "/init" ]
