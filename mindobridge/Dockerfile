ARG BUILD_FROM=hassioaddons/base:7.0.2
# hadolint ignore=DL3006
FROM ${BUILD_FROM}

# Copy MindoMQTT package.json
COPY package.json /opt/

# Set workdir
WORKDIR /opt

# Set shell
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

# Setup base
RUN \
    apk add --no-cache --virtual .build-dependencies \
        g++=9.2.0-r3 \
        gcc=9.2.0-r3 \
        libc-dev=0.7.2-r0 \
        linux-headers=4.19.36-r0 \
        make=4.2.1-r2 \
    \
    && apk add --no-cache \
        git=2.24.1-r0 \
        nodejs=12.15.0-r1 \
        npm=12.15.0-r1 \
    \
    && npm config set unsafe-perm true \
    \
    && npm install \
        --no-audit \
        --no-optional \
        --no-update-notifier \
        --only=production \
        --unsafe-perm \
    \
    && npm cache clear --force \
    \
    && apk del --no-cache --purge .build-dependencies \
    && rm -fr \
        /tmp/* 

# Copy root filesystem
COPY rootfs /

# Build arguments
ARG BUILD_ARCH
ARG BUILD_DATE
ARG BUILD_REF
ARG BUILD_VERSION

# Labels
LABEL \
    io.hass.name="Mindolife-MQTT" \
    io.hass.description="Bi-directional connector between MQTT and the Mindolife API" \
    io.hass.arch="${BUILD_ARCH}" \
    io.hass.type="addon" \
    io.hass.version=${BUILD_VERSION} \
    maintainer="Or Polaczek <or@orpolaczek.com>" \
    org.label-schema.description="Bi-directional connector between MQTT and the Mindolife API" \
    org.label-schema.build-date=${BUILD_DATE} \
    org.label-schema.name="Mindolife-MQTT" \
    org.label-schema.schema-version="1.0" \
    org.label-schema.usage="https://github.com/orpolaczek/addon-hassio-mindolife-mqtt/tree/master/README.md" \
    org.label-schema.vcs-ref=${BUILD_REF} \
    org.label-schema.vcs-url="https://github.com/orpolaczek/addon-hassio-mindolife-mqtt" \
    org.label-schema.vendor="Or Polaczek"
