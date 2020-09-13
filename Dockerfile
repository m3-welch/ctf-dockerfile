FROM kalilinux/kali-rolling:latest

ENV TZ=Europe/London

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update && apt-get -y upgrade

RUN apt -y install software-properties-common
RUN add-apt-repository ppa:ondrej/php

RUN apt-get install -y nano php7.4 php7.4-dom php7.4-mbstring php7.4-curl python3 python3-pip \
    git openvpn sudo iputils-ping wget byobu

RUN mkdir /var/apps

RUN git clone https://gitlab.com/peachyboi/dotfiles.git /var/apps/dotfiles

WORKDIR /var/apps/dotfiles

RUN git checkout master && git pull origin master

RUN cp /var/apps/dotfiles/.bashrc ~/.bashrc

WORKDIR /ctfs

VOLUME /ctfs

RUN byobu-enable

CMD byobu