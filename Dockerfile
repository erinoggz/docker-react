#Use an existing docker image as a base
FROM node:alpine as builder

WORKDIR '/app'
#Download and install dependency
COPY  package.json .
RUN npm install

COPY . .
RUN npm run build

# Dump the rest up and get just this
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html