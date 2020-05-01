
FROM gitpod/workspace-full

USER root
RUN apt-get install -yq \
        build-essential \
        libtool \
        autotools-dev \        
        netcat \
        bsdmainutils \
        automake \
        pkg-config \
        libssl-dev \
        libevent-dev \
        libboost1.71-dev \
        software-properties-common \
        && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/*
#RUN add-apt-repository -yu ppa:bitcoin/bitcoin \
#    && apt-get update \
#    && apt-get install libdb4.8-dev \
#        libdb4.8++-dev\
#    && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/*
        
#RUN apt-get install libqt5gui5 \
 #       libqt5core5a \
  #      libqt5dbus5 \
   #     qttools5-dev \
    #    qttools5-dev-tools \
     #   libprotobuf-dev \
      #  protobuf-compiler \
       # qt5-default\
        #&& apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/*
    

USER gitpod



SHELL ["/bin/bash", "--login", "-c"]

# Install custom tools, runtime, etc. using apt-get
# For example, the command below would install "bastet" - a command line tetris clone:
#

RUN wget http://download.oracle.com/berkeley-db/db-4.8.30.NC.tar.gz
RUN echo '12edc0df75bf9abd7f82f821795bcee50f42cb2e5f76a6a281b85732798364ef  db-4.8.30.NC.tar.gz' | sha256sum -c

#RUN tar -xvf db-4.8.30.NC.tar.gz
#RUN cd db-4.8.30.NC/build_unix
#RUN mkdir -p build
#RUN BDB_PREFIX=$(pwd)/build
#RUN ../dist/configure --disable-shared --enable-cxx --with-pic --prefix=$BDB_PREFIX
#RUN make install
#RUN cd ../
#RUN rm db-4.8.30.NC.tar.gz
RUN bush install_db4.sh -b

RUN wget https://repo.continuum.io/archive/Anaconda3-5.0.1-Linux-x86_64.sh
RUN bash Anaconda3-5.0.1-Linux-x86_64.sh -b
RUN rm Anaconda3-5.0.1-Linux-x86_64.sh

ENV PATH /home/gitpod/anaconda3/bin:$PATH









