FROM debian:bullseye-slim

ARG USERNAME=vscode
ARG USER_UID=1000
ARG USER_GID=$USER_UID

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update
RUN apt install -y apt-utils
RUN apt install -y build-essential
RUN apt install -y ca-certificates
RUN apt install -y curl
RUN apt install -y dialog
RUN apt install -y git
RUN apt install -y sudo
RUN apt install -y unzip
RUN apt install -y wget
# PlatiformIO
RUN apt install -y bc
RUN apt install -y clang
RUN apt install -y gcc
RUN apt install -y python3
RUN apt install -y python3-dev
RUN apt install -y python3-distutils
RUN apt install -y python3-pip
RUN apt install -y srecord
RUN apt install -y xz-utils
# Clean up
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

# https://docs.platformio.org/en/latest/faq.html#platformio-udev-rules
RUN mkdir /etc/udev && mkdir /etc/udev/rules.d
RUN curl -fsSL https://raw.githubusercontent.com/platformio/platformio-core/develop/platformio/assets/system/99-platformio-udev.rules | sudo tee /etc/udev/rules.d/99-platformio-udev.rules \
     && usermod -a -G dialout $USERNAME \
     && usermod -a -G plugdev $USERNAME

USER $USERNAME
RUN python3 -c "$(curl -fsSL https://raw.githubusercontent.com/platformio/platformio/develop/scripts/get-platformio.py)"