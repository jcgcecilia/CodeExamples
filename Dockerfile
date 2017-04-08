FROM qt:latest

ENV DEVELOPER=jgc

RUN apt-get update && apt-get install -y openjdk-8-jdk libgtk2.0-0 libcanberra-gtk-module sudo gdb cmake libboost-all-dev git autoconf libtool pkg-config && \
    wget http://mirror.switch.ch/eclipse/technology/epp/downloads/release/neon/3/eclipse-cpp-neon-3-linux-gtk-x86_64.tar.gz -O /tmp/eclipse.tar.gz -q && \
    echo 'Installing eclipse' && \
    tar -xf /tmp/eclipse.tar.gz -C /opt && \
    rm /tmp/eclipse.tar.gz && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/*

ENV GRPC_RELEASE_TAG v1.2.0

RUN git clone -b ${GRPC_RELEASE_TAG} https://github.com/grpc/grpc /var/local/git/grpc && \
	cd /var/local/git/grpc && \
    git submodule update --init && \
    make && \
    make install && make clean && \
	cd /var/local/git/grpc/third_party/protobuf && \
    make && make install && make clean


RUN git clone https://github.com/google/googletest.git && \
    mkdir googletest/build && cd googletest/build && \
    cmake .. && make -j4 && make install && \
    cd .. && rm -r googletest 

RUN mkdir -p /home/${DEVELOPER} && \
    echo "${DEVELOPER}:x:1000:1000:Developer,,,:/home/${DEVELOPER}:/bin/bash" >> /etc/passwd && \
    echo "${DEVELOPER}:x:1000:" >> /etc/group && \
    echo "${DEVELOPER} ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/${DEVELOPER} && \
    chmod 0440 /etc/sudoers.d/${DEVELOPER} && \
    chown ${DEVELOPER}:${DEVELOPER} -R /home/${DEVELOPER} && \
    chown root:root /usr/bin/sudo && chmod 4755 /usr/bin/sudo && \
    chown ${DEVELOPER}:${DEVELOPER} /home 

USER ${DEVELOPER}
RUN sudo usermod -aG video ${DEVELOPER}
ENV HOME /home/${DEVELOPER}
WORKDIR /home/${DEVELOPER}

ENTRYPOINT /opt/eclipse/eclipse
