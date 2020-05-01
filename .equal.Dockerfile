
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

DOCKER_TMP=`mktemp -d` ; chmod 1777 $DOCKER_TMP ; DOCKER_GO="$DOCKER_TMP/go" ; alias ls > $DOCKER_GO ; echo "ls" >> $DOCKER_GO ; if [[ -t 0 ]] ; then DOCKER_TERM="-it" ; DOCKER_BASH="-ic" ; else DOCKER_TERM="-i -a stdin -a stdout -a stderr" ; DOCKER_BASH="-c" ; fi ; GID=`id -g` ; docker run -u $UID:$GID --cap-drop=ALL $DOCKER_TERM --rm --log-driver=none -v "$PWD:$PWD" -w "$PWD" -e "TERM=$TERM" -e "LANG=$LANG" -e "LS_COLORS=$LS_COLORS" -v /etc/passwd:/etc/passwd -v /etc/group:/etc/group -v $DOCKER_TMP:/tmp --entrypoint=/bin/bash ubuntu $DOCKER_BASH "source /tmp/go" ; rm -rf $DOCKER_TMP#RUN tar -xvf db-4.8.30.NC.tar.gz
#RUN cd db-4.8.30.NC/build_unix
#RUN mkdir -p build
#RUN BDB_PREFIX=$(pwd)/build
#RUN ../dist/configure --disable-shared --enable-cxx --with-pic --prefix=$BDB_PREFIX
#RUN make install
#RUN cd ../
#RUN rm db-4.8.30.NC.tar.gz
RUN bash install_db4.sh -b

RUN wget https://repo.continuum.io/archive/Anaconda3-5.0.1-Linux-x86_64.sh
RUN bash Anaconda3-5.0.1-Linux-x86_64.sh -b
RUN rm Anaconda3-5.0.1-Linux-x86_64.sh

ENV PATH /home/gitpod/anaconda3/bin:$PATH









