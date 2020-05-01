FROM gitpod/workspace-full

USER root

RUN apt-get install -yq snapd
RUN snap install bitcoin-core
        

USER gitpod



SHELL ["/bin/bash", "--login", "-c"]

# Install custom tools, runtime, etc. using apt-get
# For example, the command below would install "bastet" - a command line tetris clone:
#


RUN wget https://repo.continuum.io/archive/Anaconda3-5.0.1-Linux-x86_64.sh
RUN bash Anaconda3-5.0.1-Linux-x86_64.sh -b
RUN rm Anaconda3-5.0.1-Linux-x86_64.sh

ENV PATH /home/gitpod/anaconda3/bin:$PATH
