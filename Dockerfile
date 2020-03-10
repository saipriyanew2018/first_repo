FROM node:alpine as builder

WORKDIR /usr

COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
COPY --from=builder /usr/build /usr/share/nginx/html
