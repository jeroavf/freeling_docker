FROM ubuntu:xenial
RUN apt-get update 
RUN apt-get install -y wget
WORKDIR freeling
RUN wget https://github.com/TALP-UPC/FreeLing/releases/download/4.1/freeling-4.1-xenial-amd64.deb
RUN apt-get install -y libboost-filesystem1.58.0 \
            libboost-program-options1.58.0 \
            libboost-regex1.58.0 \
            libicu55


RUN dpkg -i freeling-4.1-xenial-amd64.deb
RUN rm -rf freeling*

RUN DEBIAN_FRONTEND=noninteractive && \
    apt-get install -y locales
RUN locale-gen pt_BR.UTF-8
RUN sed -i -e 's/# pt_BR.UTF-8 UTF-8/pt_BR.UTF-8 UTF-8/' /etc/locale.gen && \
    sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
    locale-gen  && \
    dpkg-reconfigure --frontend=noninteractive locales && \
    update-locale LANG=pt_BR.UTF-8
ENV LANG pt_BR.UTF-8
ENV LANGUAGE pt_BR.UTF-8
ENV LC_ALL pt_BR.UTF-8
ENV LANG pt_BR.UTF-8
CMD /bin/bash
