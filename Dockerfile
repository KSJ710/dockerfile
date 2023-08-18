FROM php:latest

ARG USERNAME=php
ARG GROUPNAME=php
ARG UID=1710
ARG GID=1710
ARG HOME=/home/${USERNAME}
ENV LANG C.UTF-8

RUN apt update && apt install -y sudo && groupadd -g ${GID} ${GROUPNAME} \
    && useradd -m -u ${UID} -g ${GID} ${USERNAME}  \
    && echo "${USERNAME}:${GROUPNAME}" | chpasswd && echo "${USERNAME} ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers && echo "Set disable_coredump false" >> /etc/sudo.conf && echo "root:root" | chpasswd

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN apt install -y vim git zip
RUN sh -c "$(curl -fsSL https://starship.rs/install.sh)" -- --yes

CMD [ "bash" ]