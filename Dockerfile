FROM kal444/docker-hugo:latest
MAINTAINER Kyle Huang <kyle@yellowaxe.com>

NODEVER=node_8.x
DISTRO="$(lsb_release -s -c)"

RUN curl --silent https://deb.nodesource.com/gpgkey/nodesource.gpg.key | sudo apt-key add -
RUN echo "deb https://deb.nodesource.com/$VERSION $DISTRO main" | sudo tee /etc/apt/sources.list.d/nodesource.list
RUN echo "deb-src https://deb.nodesource.com/$VERSION $DISTRO main" | sudo tee -a /etc/apt/sources.list.d/nodesource.list

RUN apt-get update && apt-get install -y --no-install-recommends nodejs \
  && apt-get autoremove -y \
  && apt-get clean -y \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
  && npm install -g firebase-tools

RUN mkdir /site /public

WORKDIR /site

VOLUME /site
VOLUME /public

