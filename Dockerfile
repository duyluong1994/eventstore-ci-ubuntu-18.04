FROM ubuntu:18.04

RUN apt-get update \ 
    && apt install software-properties-common -y

RUN add-apt-repository ppa:git-core/ppa -y

RUN apt-get update \
    && apt-get install -y apt-transport-https wget unzip git rake python sudo gnupg libcurl3
