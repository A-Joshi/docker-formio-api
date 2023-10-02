FROM alpine:3.18

#https://github.com/formio/formio/archive/refs/tags/v3.3.2.zip

ARG FORMIO_VERSION=3.3.2

WORKDIR /app

RUN   apk update && \
      apk upgrade && \
      apk add curl \
              npm \
              rsync


RUN  curl -L https://github.com/formio/formio/archive/refs/tags/v${FORMIO_VERSION}.zip -o formio-${FORMIO_VERSION}.zip && \
     unzip  -d /app/ formio-${FORMIO_VERSION}.zip && \
     rsync -avP formio-${FORMIO_VERSION}/ ./ && \
     /bin/rm -rf formio-${FORMIO_VERSION}*

RUN  npm install
 

CMD npm start
  
