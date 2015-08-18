#
# Rocketgraph NodeJS server with couchDB
#

# Pull base image.
FROM rocketgraph/couchdb

MAINTAINER Konstantinos Christofilos <kostas.christofilos@rocketgraph.com>

#Install NodeJS
RUN apt-get -y install nodejs

#Link nodejs to node
RUN ln -s /usr/bin/nodejs /usr/bin/node

#Install npm
RUN apt-get -y install npm

#Install node-supervisor
RUN npm install supervisor -g

#Setup supervisord
ADD ./supervisord.conf /etc/supervisor/supervisord.conf
ADD ./supervisor_couchdb.conf /etc/supervisor/conf.d/supervisor_couchdb.conf

RUN mkdir /node_app

VOLUME ["/node_app"]

EXPOSE 3000

WORKDIR "/node_app"