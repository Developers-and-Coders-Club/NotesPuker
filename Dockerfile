# use node 14 alpine as base image
FROM node:14-alpine3.17

# set working directory
WORKDIR /usr/src/app

# install pm2
RUN npm install pm2 -g

# copy package.json and package-lock.json
COPY package*.json ./

# install dependencies
RUN npm install --production

# copy source code
COPY . .

# Create a non-root user and switch to it
RUN adduser -D myuser
USER myuser

# expose port 3000
EXPOSE 3000

# start app
CMD ["pm2-runtime", "start", "node", "--", "app.js"]