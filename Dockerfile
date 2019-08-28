FROM node:12-alpine as builder

WORKDIR /usr/app

COPY package.json .
RUN npm i
COPY . .

RUN npm run build

FROM nginx:1.17-alpine
COPY --from=builder /usr/app/build /usr/share/nginx/html