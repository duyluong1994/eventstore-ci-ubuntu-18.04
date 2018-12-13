# Description
Docker Image for build of EventStore on Ubuntu 18.04 (bionic) hosted at https://hub.docker.com/r/eventstore/eventstore-ci-ubuntu-18.04/
The build is currently used by our CI (Azure Pipelines)

### Base Image: `ubuntu:18.04`  
### Installs:
- mono 5.16.0
- dotnet-sdk-2.1
- node.js 8.11.4
- fpm (latest)
- awscli (latest)
