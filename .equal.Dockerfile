
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
#        libdb++-dev  \
        libboost1.71-dev \
        software-properties-common \
        && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/*
        
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
RUN tar -xvf db-4.8.30.NC.tar.gz
RUN sed -i 's/__atomic_compare_exchange/__atomic_compare_exchange_db/g' db-4.8.30.NC/dbinc/atomic.h
RUN cd db-4.8.30.NC/build_unix \
 && mkdir -p build \
 && BDB_PREFIX=$(pwd)/build \
 && ../dist/configure --disable-shared --enable-cxx --with-pic --prefix=$BDB_PREFIX \
 && make install 
#RUN rm db-4.8.30.NC.tar.gz

RUN git clone https://github.com/bitcoin/bitcoin.git \
 && cd bitcoin \
 && git checkout v0.19.1 \ 
 && ./autogen.sh \
# && ./configure CPPFLAGS="-I${BDB_PREFIX}/include/ -O2" LDFLAGS="-L${BDB_PREFIX}/lib/" \
 && ./configure BDB_CFLAGS="-I${BDB_PREFIX}/include/" BDB_LIBS="-L${BDB_PREFIX}/lib/ -ldb_cxx-4.8" \
 && make \
 && make install

RUN wget https://repo.continuum.io/archive/Anaconda3-5.0.1-Linux-x86_64.sh
RUN bash Anaconda3-5.0.1-Linux-x86_64.sh -b
RUN rm Anaconda3-5.0.1-Linux-x86_64.sh

ENV PATH /home/gitpod/anaconda3/bin:$PATH









