### Example of Dockerfile

# Pull operating system image
FROM ubuntu:latest

# Commands to be executed when after the image is loaded
# Defining variables for build time and run time
ENV NODE_VERSION="20"
ENV PYTHON_VERSION="3"
ENV USER_NAME="shinich39"
ENV USER_EMAIL="shinich39@gmail.com"
# ENV REPO_TOKEN=""
# ENV REPO_NAME=""

# Set author of docker image
LABEL org.opencontainers.image.authors="${USER_EMAIL}"

### Setup git

# Update apt
RUN apt update
RUN apt-get update

# Install vim, curl and git
RUN apt-get install -y \
    vim \
    curl \
    git

# Set git configuration settings
RUN git config --global user.name "${USER_NAME}" 
RUN git config --global user.email "${USER_EMAIL}"

# WORKDIR /app likes mkdir /app && cd /app
WORKDIR /app

### Setup nodejs

# Get install script
# https://deb.nodesource.com/setup_${NODE_VERSION}.x
RUN curl -sL https://deb.nodesource.com/setup_${NODE_VERSION}.x | bash

# Install nodejs
RUN apt-get install -y nodejs

# Clone from repository
# RUN git clone https://${REPO_TOKEN}@github.com/${REPO_NAME}
# RUN cd ${REPO_NAME}

# Install node modules
# RUN npm install ...

### Setup python

# Install python
RUN apt-get install -y \
    python3 \
    python3-pip
    
# Bugfix: --break-system-packages
RUN python3 -m pip config set global.break-system-packages true

# Bugfix: The package was installed by debian
RUN pip install --upgrade pip --ignore-installed

# Install python modules
# RUN pip install ...