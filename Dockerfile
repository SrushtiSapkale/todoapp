FROM node:14

WORKDIR /todoapp

COPY . /todoapp

RUN npm install

CMD ["node", "index.js"]

