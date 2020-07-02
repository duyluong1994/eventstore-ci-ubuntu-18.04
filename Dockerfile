FROM ubuntu:18.04

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update \ 
    && apt install software-properties-common -y

RUN add-apt-repository ppa:git-core/ppa -y

RUN apt-get update \
    && apt-get install -y apt-transport-https wget unzip git rake python sudo gnupg libcurl3

RUN wget -q -O packages-microsoft-prod.deb https://packages.microsoft.com/config/ubuntu/18.04/packages-microsoft-prod.deb \
    && sudo dpkg -i packages-microsoft-prod.deb

RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF \
    && echo "deb http://download.mono-project.com/repo/ubuntu stable-bionic/snapshots/5.16.0.220 main" main | sudo tee /etc/apt/sources.list.d/mono-official.list \
    && apt-get update

RUN apt-get install -y mono-devel=5.16.0.220-0xamarin4+ubuntu1804b1 msbuild=1:16.0+xamarinxplat.2018.09.26.17.53-0xamarin3+ubuntu1804b1 dotnet-sdk-2.1

#NodeJS v8.11.4 (LTS) EOL December 2019
RUN wget -q -O nodejs.deb https://deb.nodesource.com/node_8.x/pool/main/n/nodejs/nodejs_8.11.4-1nodesource1_amd64.deb && dpkg -i nodejs.deb

#fpm
RUN apt-get install -y ruby ruby-dev build-essential \
    && gem install --no-ri --no-rdoc fpm

#aws cli
RUN wget -q -O awscli-bundle.zip "https://s3.amazonaws.com/aws-cli/awscli-bundle.zip" \
    && unzip awscli-bundle.zip \
    && ./awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws \
    && rm -rf /awscli-bundle \
    && rm awscli-bundle.zip
