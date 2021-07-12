# Stage 1

FROM node:10-alpine as build-step
RUN mkdir -p /app
WORKDIR /angular-frontend/src/app
COPY package.json /app
RUN npm install
COPY  . /angular-frontend/src/app
RUN npm run build --prod

# Stage 2

FROM nginx:alpine
COPY  --from=builder /angular-frontend/dist/angular-frontend /usr/share/nginx/html
EXPOSE 80