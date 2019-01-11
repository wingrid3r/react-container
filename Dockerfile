FROM node:alpine as builder
WORKDIR '/react-web-app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx as runner
COPY --from=builder /react-web-app/build /usr/share/nginx/html
