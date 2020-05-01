
FROM gitpod/workspace-full

USER root
RUN apt-get install -yq \
        automake \
        pkg-config \
        libtool \
        libssl-dev \
        autotools-dev \
        libevent-dev \
        netcat \
        bsdmainutils \
#        libboost-all-dev \
        software-properties-common \
        && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/*
#RUN add-apt-repository ppa:bitcoin/bitcoin \
#    && apt-get update \
 #   && apt-get install libdb4.8-dev \
  #      libdb4.8++-dev\
   # && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/*
        
RUN apt-get install libqt5gui5 \
        libqt5core5a \
        libqt5dbus5 \
        qttools5-dev \
        qttools5-dev-tools \
        libprotobuf-dev \
        protobuf-compiler \
        qt5-default\
        && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/*
    

USER gitpod



SHELL ["/bin/bash", "--login", "-c"]

# Install custom tools, runtime, etc. using apt-get
# For example, the command below would install "bastet" - a command line tetris clone:
#

RUN wget https://repo.continuum.io/archive/Anaconda3-5.0.1-Linux-x86_64.sh
RUN bash Anaconda3-5.0.1-Linux-x86_64.sh -b
RUN rm Anaconda3-5.0.1-Linux-x86_64.sh

ENV PATH /home/gitpod/anaconda3/bin:$PATH







