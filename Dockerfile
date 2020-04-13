# Use the official image as a parent image
FROM ubuntu:19.10

# Set the working directory
WORKDIR /usr/src/app

# Copy the file from your host to your current location
# COPY package.json .

# Run the commands inside your image filesystem
RUN echo "HELLO HELLO HELLO HELLO HELLO HELLO HELLO HELLO HELLO HELLO"
RUN apt-get update
RUN apt-get -y install sudo
RUN apt-get -y install cmake
RUN apt-get -y install gcc-arm-none-eabi
RUN apt-get -y install python3
RUN apt-get -y install python3-pip
RUN apt-get -y install git
RUN pip3 install --upgrade pip
RUN pip3 install PyYAML

RUN useradd -m docker && echo "docker:docker" | chpasswd && adduser docker sudo

USER docker

# Inform Docker that the container is listening on the specified port at runtime.
EXPOSE 7080

# Run the specified command within the container.
# CMD [ "npm", "start" ]

# Copy the rest of your app's source code from your host to your image filesystem.
COPY . .