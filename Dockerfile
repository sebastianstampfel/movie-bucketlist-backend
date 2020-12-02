FROM node::15

WORKDIR /usr/src/app

COPY . .

RUN npm install

EXPOSE 6666

CMD [ "node", "app.js" ]