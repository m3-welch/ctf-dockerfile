# docker build /home/global/dockerfiles/ctf -t ctf:latest
# sudo docker run --privileged --cap-add=NET_ADMIN --device /dev/net/tun -v /var/apps/ctfs:/ctfs -it ctf:latest byobu


# Get latest Kali image
FROM kalilinux/kali-rolling:latest

# Set Timezone
ENV TZ=Europe/London
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Update packages
RUN apt-get update && apt-get -y upgrade

# Install packages
RUN apt -y install software-properties-common
RUN add-apt-repository ppa:ondrej/php
RUN apt-get install -y nano php7.4 php7.4-dom php7.4-mbstring php7.4-curl python3 python3-pip \
    git openvpn sudo iputils-ping wget byobu

# Setup dotfiles (for aliases)
RUN mkdir /var/apps
RUN git clone https://gitlab.com/peachyboi/dotfiles.git /var/apps/dotfiles
WORKDIR /var/apps/dotfiles
RUN git checkout master && git pull origin master
RUN cp /var/apps/dotfiles/.bashrc ~/.bashrc

# Mount the /ctfs volume
WORKDIR /ctfs
VOLUME /ctfs

# Enable and run byobu
RUN byobu-enable
CMD byobu