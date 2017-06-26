FROM kal444/docker-hugo:latest
MAINTAINER Kyle Huang <kyle@yellowaxe.com>

RUN apt-get update && apt-get install -y --no-install-recommends npm nodejs \
  && apt-get autoremove -y \
  && apt-get clean -y \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
  && npm install -g firebase-tools

RUN mkdir /site /public

WORKDIR /site

VOLUME /site
VOLUME /public

