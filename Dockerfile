FROM node:14-alpine

# Create app directory
RUN mkdir -p /home/node/app/node_modules && chown -R node:node /home/node/app
WORKDIR /home/node/app

USER node

# Install app dependencies
COPY package*.json ./
RUN npm install

# Bundle app source
COPY --chown=node:node . .

RUN cp .env.default .env

# use .env variable isntead of hard coded 8080
EXPOSE 8080
CMD [ "node", "server.js"]