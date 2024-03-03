FROM arm64v8/debian:bookworm-slim

# packages setup
RUN \
export DEBIAN_FRONTEND=noninteractive && \
apt-get update && \
apt-get -y install net-tools git wget vim sudo zip corkscrew rsync iputils-ping locales apt-utils && \
locale-gen en_US en_US.UTF-8

RUN DEBIAN_FRONTEND=noninteractive apt-get install --no-install-recommends tzdata

RUN echo "dash dash/sh boolean false" | debconf-set-selections
RUN echo "Asia/Kolkata" | tee /etc/timezone
RUN DEBIAN_FRONTEND=noninteractive dpkg-reconfigure dash

RUN apt-get install -y devscripts equivs debmake

RUN export LC_ALL="en_US.UTF-8" && \
    export LC_CTYPE="en_US.UTF-8" && \
    export LC_NUMERIC="en_US.UTF-8"

