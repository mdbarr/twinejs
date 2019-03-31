FROM node:10-alpine
WORKDIR /twinejs
COPY package.json yarn.lock ./
RUN yarn install
COPY . .
RUN yarn build:web

FROM nginx:stable-alpine
COPY --from=0 /twinejs/dist/web /usr/share/nginx/html
