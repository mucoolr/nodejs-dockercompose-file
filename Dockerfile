FROM node:16

RUN mkdir -p /usr/src/app

WORKDIR /usr/src/app

COPY package*.json /usr/src/app/

RUN npm install

COPY . /usr/src/app/

ENV NODE_ENV=test 

EXPOSE 51005

ENTRYPOINT [ "./createmysql.sh","npm","start"] 