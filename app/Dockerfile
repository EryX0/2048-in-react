FROM node:18.17.1-alpine3.18
COPY ./package.json ./yarn.lock ./craco.config.js /app/
WORKDIR /app/
RUN yarn install --frozen-lockfile
COPY . /app/
RUN export NODE_OPTIONS=--openssl-legacy-provider && yarn build