# nodejs-dockercompose

To create the image , I have written the Docker with node as base image.
```
FROM node:16

RUN mkdir -p /usr/src/app

WORKDIR /usr/src/app

COPY package*.json /usr/src/app/

RUN npm install

COPY . /usr/src/app/

ENV NODE_ENV=test 

EXPOSE 51005

CMD [ "npm", "start" ]
```
In the Working Directory , I have copied all the source files and Exposed 51005 of the container.

I have created a docker compose file with 4 containers

Backend
mongodb
mysql
nginx(for http to https redirection)
To create the ssl certificate i have used ssl-key gen on my local and then copied those certificates to nginx conf.d Directory.

I have create an api.conf file for http to https redirection where i have redirected traffic to Backend container on port 51005.

To keep the data even if the container destorys , I have created volumes with names db and mongo_db_container which will bind the container data to these folders created in my local.

To wait , till the mysql container launches i have created a createmysql.sh file which halts the backend container for 5S to sleep , till the time mysql container launches and connection is successful.


After running `docker compose up`, run `http://localhost/mongo/user` , it will be redirected `https://localhost/mongo/user`
