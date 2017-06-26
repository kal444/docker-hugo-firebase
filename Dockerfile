FROM kal444/docker-hugo:latest
MAINTAINER Kyle Huang <kyle@yellowaxe.com>

ENV NODEVER=node_8.x
ENV DISTRO="$(lsb_release -s -c)"

RUN curl --silent https://deb.nodesource.com/gpgkey/nodesource.gpg.key | apt-key add -
RUN echo "deb https://deb.nodesource.com/$NODEVER $DISTRO main" | tee /etc/apt/sources.list.d/nodesource.list
RUN echo "deb-src https://deb.nodesource.com/$NODEVER $DISTRO main" | tee -a /etc/apt/sources.list.d/nodesource.list

RUN apt-get update && apt-get install -y --no-install-recommends apt-transport-https

RUN apt-get update && apt-get install -y --no-install-recommends nodejs \
  && apt-get autoremove -y \
  && apt-get clean -y \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
  && npm install -g firebase-tools

RUN mkdir /site /public

WORKDIR /site

VOLUME /site
VOLUME /public

