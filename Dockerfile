# Use the official image as a parent image
FROM ubuntu:20.04

# Set the working directory
WORKDIR /usr/src/greatfet

# Add Jenkins as a user with sufficient permissions
RUN mkdir /home/jenkins
RUN groupadd -g 136 jenkins
RUN useradd -r -u 125 -g jenkins -d /home/jenkins jenkins
RUN gpasswd -a jenkins plugdev
RUN chown jenkins:jenkins /home/jenkins
USER jenkins

# Install prerequisites
RUN apt-get update && apt-get install -y
RUN apt-get -y install cmake
RUN apt-get -y install gcc-arm-none-eabi
RUN apt-get -y install python3
RUN apt-get -y install python3-pip
RUN apt-get -y install libusb-1.0-0
RUN apt-get -y install git

# Inform Docker that the container is listening on the specified port at runtime.
EXPOSE 8080

# Copy the rest of your app's source code from your host to your image filesystem.
COPY . .