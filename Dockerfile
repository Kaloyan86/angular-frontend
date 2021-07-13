FROM node:16-alpine3.11 
COPY . .
FROM nginx:1.21.1
COPY . /usr/share/nginx/html
