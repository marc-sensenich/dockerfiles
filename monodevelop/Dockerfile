FROM ubuntu:14.04

MAINTAINER Marc Sensenich <sensenichm91@gmail.com>

RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 \
    --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF

RUN echo "deb http://download.mono-project.com/repo/debian wheezy main" \
    > /etc/apt/sources.list.d/mono-xamarin.list

RUN echo "deb http://download.mono-project.com/repo/debian wheezy-apache24-compat main" \
    >> /etc/apt/sources.list.d/mono-xamarin.list

RUN apt-get update && apt-get install -y \
    ca-certificates-mono \
    libcanberra-gtk-module \
    mono-complete \
    mono-devel \
    referenceassemblies-pcl \
	  # --no-install-recommends \
	&& rm -rf /var/lib/apt/lists/*

ENTRYPOINT [ "/bin/bash" ]
