FROM ubuntu:14.04
MAINTAINER nkpatro@gmail.com

# Set environment variables. 
ENV HOME="/root" DEBIAN_FRONTEND=noninteractive

######### Set locale to UTF-8 ################### 
RUN \
    locale-gen en_US.UTF-8 && \
    echo LANG=\"en_US.UTF-8\" > /etc/default/locale && \
    echo "Europe/Berlin" > /etc/timezone

# Install. 
RUN \
  sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list && \
  apt-get update && \
  apt-get -y upgrade && \
  apt-get install -y build-essential software-properties-common curl man unzip vim nano rsync && \
  apt-get -y autoremove && apt-get clean && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Add files.
ADD root /root

CMD ["bash"]
