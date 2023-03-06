FROM mcr.microsoft.com/devcontainers/python:0-3.11

ARG USERNAME=vscode

ENV DEBIAN_FRONTEND=noninteractive
RUN apt update
RUN apt install -y apt-utils
RUN apt install default-jdk -y
RUN apt install -y sudo
RUN apt install -y unzip
RUN apt install -y wget
RUN wget -c https://services.gradle.org/distributions/gradle-6.9.2-bin.zip -P /tmp
RUN sudo unzip -d /opt/gradle /tmp/gradle-*
COPY resources/gradle/gradle.sh /etc/profile.d/gradle.sh
COPY resources/*.sh /tmp
RUN chmod +x /tmp/chmod.sh
RUN /tmp/chmod.sh /etc/profile.d/gradle.sh
RUN /tmp/chmod.sh /tmp/bash.sh
CMD ["/tmp/bash.sh", "source /etc/profile.d/gradle.sh"]
RUN apt autoremove -y
RUN apt clean -y
RUN rm -rf /var/lib/apt/lists/*
ENV DEBIAN_FRONTEND=dialog

USER $USERNAME