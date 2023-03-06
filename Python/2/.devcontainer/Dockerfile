FROM debian:bullseye-slim

ARG USERNAME=vscode
ARG USER_UID=1000
ARG USER_GID=$USER_UID

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update
RUN apt install -y apt-utils
RUN apt install -y build-essential
RUN apt install -y ca-certificates
RUN apt install -y dialog
RUN apt install -y python2
RUN apt install -y nodejs
RUN apt install -y npm
RUN apt install -y sudo
RUN apt autoremove -y
RUN apt clean -y
RUN rm -rf /var/lib/apt/lists/*
ENV DEBIAN_FRONTEND=dialog

RUN if [ ${USER_UID:-0} -ne 0 ] && [ ${USER_GID:-0} -ne 0 ]; then \
        groupadd --gid $USER_GID $USERNAME \
        && useradd -s /bin/bash --uid $USER_UID --gid $USER_GID -m $USERNAME \
        && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME\
        && chmod 0440 /etc/sudoers.d/$USERNAME \
    ; fi

USER $USERNAME