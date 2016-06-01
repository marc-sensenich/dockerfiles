# VERSION:		  0.1
# DESCRIPTION:	  Create the Arduino IDE in a container
# AUTHOR:		  Marc Sensenich <sensenichm91@gmail.com>
# COMMENTS:
#	This file describes how to build the Arduino IDE
#	in a container with all dependencies installed.
#
#	Tested on Ubuntu 15.10.
#
# USAGE:
#	# Download atom Dockerfile
#	wget http://raw.githubusercontent.com/jfrazelle/dockerfiles/master/atom/Dockerfile
#
#	# Build atom image
#	docker build -t arduino .
#
# # Ensure that your Arduino is bound to a device
#
# # Run the Arduino IDE
#	docker run --rm -v /tmp/.X11-unix:/tmp/.X11-unix \
#		--device /dev/ttyACM0 -e DISPLAY=$DISPLAY atom
#
# FROM ubuntu:14.04

FROM debian:jessie

MAINTAINER Marc Sensenich <sensenichm91@gmail.com>

RUN apt-get update -y && \
    apt-get install -y \
            arduino \
            arduino-core \
            libcanberra-gtk-module

ENTRYPOINT [ "arduino" ]
