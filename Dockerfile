FROM ubuntu:latest

RUN apt update && apt upgrade -y
RUN apt install -y perl-modules curl lsof libc6-i386 libgcc1 bzip2

RUN useradd -m steam
RUN curl -sL https://raw.githubusercontent.com/lyuhau/ark-server-tools/master/netinstall.sh | bash -s steam

USER steam
WORKDIR /home/steam

RUN arkmanager install
CMD arkmanager update --update-mods && arkmanager restore && arkmanager run

EXPOSE 27015/udp
EXPOSE 27015/tcp
EXPOSE 27016/udp
EXPOSE 27016/tcp
EXPOSE 7777/udp
EXPOSE 7777/tcp
EXPOSE 7778/udp
EXPOSE 7778/tcp
EXPOSE 27020/tcp
EXPOSE 32330/tcp
