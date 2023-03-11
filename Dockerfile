FROM node:18-alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# /app/build will be the folder with result of the build command by npm...

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
