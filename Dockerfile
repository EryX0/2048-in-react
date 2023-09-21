FROM node:18.17.1-alpine3.18 AS builder
COPY ./app/package.json ./app/yarn.lock ./app/craco.config.js /app/
WORKDIR /app/
RUN yarn install --frozen-lockfile
COPY ./app/ /app/
RUN export NODE_OPTIONS=--openssl-legacy-provider && yarn build

FROM nginx:1.25.2-alpine AS production
#ENV NODE_ENV production
COPY --from=builder /app/build /2048-in-react
COPY ./nginx/2048-react.conf /etc/nginx/conf.d/default.conf
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
