FROM node:10-alpine as build-angular
RUN mkdir -p /app
WORKDIR /app
COPY package.json /app
RUN npm install
COPY . /app
RUN npm build
RUN npm run build

FROM nginx:1.17.1-alpine
COPY --from=build-angular . .