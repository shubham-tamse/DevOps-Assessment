FROM node:16.3.0-alpine

ENV TZ=Asia/Kolkata

ADD "package.json" /app/

WORKDIR /app

RUN apk add --no-cache git

RUN npm install --production --silent

RUN apk add --update tzdata bash && cp /usr/share/zoneinfo/Asia/Kolkata /etc/localtime

EXPOSE 8080

ADD . /app

CMD ["node", "server.js"]
