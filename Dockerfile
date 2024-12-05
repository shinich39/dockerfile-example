# Example of Dockerfile

# Pull operating system image
FROM ubuntu:latest

# Commands to be executed when after the image is loaded
# Defining variables for build time and run time
ENV NODE_VERSION="20"
ENV USER_NAME="shinich39"
ENV USER_EMAIL="shinich39@gmail.com"
# ENV REPO_TOKEN=""
# ENV REPO_NAME=""

# Set author of docker image
LABEL org.opencontainers.image.authors="${USER_EMAIL}"

# Update apt
RUN apt-get update

# Install curl and git
RUN apt-get install -y \
    curl \
    git

# Get install script
# https://deb.nodesource.com/setup_${NODE_VERSION}.x
RUN curl -sL https://deb.nodesource.com/setup_${NODE_VERSION}.x | bash

# Install nodejs
RUN apt-get install -y nodejs

# Git setup
RUN git config --global user.name "${USER_NAME}" 
RUN git config --global user.email "${USER_EMAIL}"

# WORKDIR /app likes mkdir /app && cd /app
WORKDIR /app

# Clone from repository
# RUN git clone https://${REPO_TOKEN}@github.com/${REPO_NAME}
# RUN cd ${REPO_NAME}

# Install node modules
# RUN npm install