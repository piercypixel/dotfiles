FROM ubuntu:18.04

WORKDIR /home/

COPY . .

ARG USERNAME=root

USER $USERNAME

RUN bash ./setup.sh
