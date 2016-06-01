FROM debian:jessie

ENV SCALA_DOWNLOAD_URL http://downloads.typesafe.com/scala/2.11.7/scala-2.11.7.tgz
ENV SCALA_TAR_FILE scala-2.11.7.tgz
ENV SCALA_DOWNLOAD_DIR scala-2.11.7
ENV SCALA_HOME /usr/local/share/scala
ENV PATH $PATH:$SCALA_HOME/bin
ENV SCALA_WORKDIR /usr/scala

RUN apt-get update -y && \
    apt-get install -y \
      openjdk-7-jre \
      wget

RUN wget $SCALA_DOWNLOAD_URL && \
    tar -xzf $SCALA_TAR_FILE && rm -f $SCALA_TAR_FILE && \
    mv $SCALA_DOWNLOAD_DIR $SCALA_HOME

RUN mkdir $SCALA_WORKDIR

WORKDIR $SCALA_WORKDIR

ENTRYPOINT ["scala"]
