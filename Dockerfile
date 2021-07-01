FROM node:alpine as builder

WORKDIR '/app'

COPY package.json .

RUN npm install

COPY . .

RUN chmod 777 node_modules

RUN npm run build

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html