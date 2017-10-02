FROM timonier/php:fpm

LABEL \
    maintainer="Morgan Auchede <morgan.auchede@gmail.com>"

ENV \
    CAKEBOX_VERSION=latest \
    S6_BEHAVIOUR_IF_STAGE2_FAILS=2 \
    S6_KEEP_ENV=1

RUN set -ex \

    # Prepare system

    && export DEBIAN_FRONTEND=noninteractive \

    && echo "deb http://nginx.org/packages/mainline/debian/ jessie nginx" >> /etc/apt/sources.list.d/nginx.list \
    && apt-key adv --keyserver hkp://pgp.mit.edu:80 --recv-keys 573BFD6B3D8FBC641079A6ABABF5BD827BD9BF62 \

    && apt-get update \

    # Install packages

    && export BUILD_DEPS="npm" \

    && apt-get install --no-install-recommends --yes \
           ${BUILD_DEPS} \
           gettext \
           nginx \

    && ln -s $(which nodejs) /usr/bin/node \
    && npm install -g \
           bower \

    && curl --location "https://getcomposer.org/installer" | php -- --install-dir /usr/bin \
    && mv /usr/bin/composer.phar /usr/bin/composer \

    # Install cakebox/cakebox

    && export $(curl "https://raw.githubusercontent.com/timonier/version-lister/release/generated/cakebox/${CAKEBOX_VERSION}" | xargs) \

    && git clone https://github.com/cakebox/cakebox /usr/share/cakebox \
    && git -C /usr/share/cakebox checkout "v${CAKEBOX_VERSION}" \
    && composer install --no-dev --optimize-autoloader --working-dir /usr/share/cakebox \
    && sh -c "cd /usr/share/cakebox && bower --allow-root install" \

    # Clean

    && apt-get remove --purge --yes \
           ${BUILD_DEPS} \
    && apt-get autoremove --purge --yes \

    && rm --force --recursive \
           /etc/nginx/conf.d/default.conf \
           /root/.cache \
           /root/.config \
           /root/.composer \
           /root/.local \
           /root/.npm \
           /tmp/* \
           /usr/bin/composer \
           /usr/bin/node \
           /usr/local/lib/node_modules \
           /usr/share/cakebox/.git \
           /usr/share/cakebox/config/default.php.dist \
           /usr/share/nginx \
           /var/lib/apt/lists/*

COPY ./rootfs /
