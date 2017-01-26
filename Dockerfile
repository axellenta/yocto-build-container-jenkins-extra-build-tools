# Yocto build image with Yocto 2.2 support (based on Ubuntu 16.04 LTS)
FROM axellenta/yocto-jenkins-swarm-build:1.1.1

USER root

# Install extra build tools
RUN DEBIAN_FRONTEND="noninteractive" apt-get -q update && \
    DEBIAN_FRONTEND="noninteractive" apt-get -qq install -y \
    cmake && \
    apt-get -q clean -y && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    rm -f /var/cache/apt/*.bin && \
    find /usr/share/man -name "*.gz" | xargs rm -f

USER builduser
