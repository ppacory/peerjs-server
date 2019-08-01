# nodejs / debian:Buster 
FROM node:buster

# install nginx server
RUN set -x \
  && apt-get update && apt-get upgrade -y \
  && apt-get -y install nginx
COPY nginx/* ./var/www/html/  
  
# install peerjs-server  
RUN mkdir /peer-server
WORKDIR /peer-server
COPY bin ./bin
COPY package.json .
COPY src ./src
COPY config ./config
COPY app.json .
RUN npm install


# entrypoint
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
EXPOSE 80 9000
ENTRYPOINT /usr/bin/entrypoint.sh

#ENTRYPOINT ["node", "bin/peerjs"]
#CMD [ "--port", "9000", "--path", "/myapp" ]
