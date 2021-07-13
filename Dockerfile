FROM nginx:alpine 
COPY --from=node /app/dist/angular-frontend /usr/share/nginx/htm
EXPOSE 80

FROM node:10 as node
WORKDIR /app
COPY . .
RUN npm install
RUN npm run build 