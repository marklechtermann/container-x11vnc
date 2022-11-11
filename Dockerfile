FROM ubuntu

ENV DEBIAN_FRONTEND=noninteractive

RUN set -ex; \
    apt-get update; \
    apt-get install -y \
    bash \
    fluxbox \
    git \
    net-tools \
    novnc \
    supervisor \
    x11vnc \
    xterm \
    xvfb \
    gtk2.0 \
    xdotool \
    wget

RUN apt-get install -y fonts-liberation xdg-utils

RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb && \
    dpkg -i google-chrome-stable_current_amd64.deb && \
    rm google-chrome-stable_current_amd64.deb

ENV HOME=/root \
    LANG=en_US.UTF-8 \
    LANGUAGE=en_US.UTF-8 \
    LC_ALL=C.UTF-8 \
    DISPLAY=:0.0 \
    DISPLAY_WIDTH=1024 \
    DISPLAY_HEIGHT=768

ADD /files /novncadmin
ADD index.html /usr/share/novnc/

RUN chmod 755 "/novncadmin/entrypoint.sh"

WORKDIR /novncadmin

ENTRYPOINT ["/novncadmin/entrypoint.sh"]
