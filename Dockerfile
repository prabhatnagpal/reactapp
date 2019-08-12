FROM node:alpine as builder

WORKDIR '/app'

RUN npm install

RUN npm run build


FROM nginx:alpine

EXPOSE 80

COPY --from=builder /app/build /usr/share/nginx/html
