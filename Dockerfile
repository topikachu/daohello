FROM node:0.10-slim
 
MAINTAINER Gong Yi <topikachu@163.com>
 
#
COPY dockerscript/sources.list /etc/apt/sources.list
COPY .  /usr/src/
WORKDIR /usr/src
RUN apt-get update \
&& apt-get install -y build-essential g++ ruby git \
&& npm install -g bower grunt-cli \
&& gem install sass \
&& bower install --allow-root \
&& npm install \
&& grunt build
ENV NODE_ENV production
ENV PORT 8080
EXPOSE 8080
WORKDIR /usr/src/dist

CMD ["npm", "start"]


