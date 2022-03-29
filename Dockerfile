FROM node:14-alpine

# Create node server directory
WORKDIR /server

# Install node server dependencies
COPY package.json ./
RUN npm install
COPY . .

# RUN cp .env.default .env

EXPOSE $REACT_DOCKER_PORT
CMD [ "node", "server.js"]