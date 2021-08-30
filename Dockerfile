FROM debian:11.0-slim
RUN apt update
RUN apt upgrade -y
RUN apt install -y curl
RUN apt install -y build-essential
RUN useradd --create-home --user-group sdptk
RUN mkdir /usr/local/TOOLKIT
RUN chown sdptk:sdptk /usr/local/TOOLKIT

USER sdptk
WORKDIR /usr/local
RUN curl -sSfLR 'https://git.earthdata.nasa.gov/rest/git-lfs/storage/DAS/sdptoolkit/a7ccbb33de2fddf1bafb718cd2d57b9f7ea0416cd80ccb4cf03bd1ec9080d96b?response-content-disposition=attachment%3B%20filename%3D%22SDPTK5.2.20v1.01.tar.Z%22%3B%20filename*%3Dutf-8%27%27SDPTK5.2.20v1.01.tar.Z' | tar xf -

WORKDIR /usr/local/TOOLKIT
RUN bin/INSTALL -batch -pgshome /usr/local/TOOLKIT -log /home/sdptk/build.log
