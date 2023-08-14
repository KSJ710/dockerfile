FROM python:3.11.4-bookworm

ARG USERNAME=python
ARG GROUPNAME=python
ARG UID=1710
ARG GID=1710
ARG HOME=/home/${USERNAME}
ENV LANG C.UTF-8

RUN apt update && groupadd -g ${GID} ${GROUPNAME} \
    && useradd -m -u ${UID} -g ${GID} ${USERNAME}  \
    && echo "${USERNAME}:${GROUPNAME}" | chpasswd && echo "${USERNAME} ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers && echo "Set disable_coredump false" >> /etc/sudo.conf && echo "root:root" | chpasswd

RUN apt install -y vim
RUN sh -c "$(curl -fsSL https://starship.rs/install.sh)" -- --yes

CMD [ "bash" ]