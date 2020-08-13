# builder phase
FROM node:alpine as builder

WORKDIR '/app'

COPY package.json .

RUN npm install

COPY . .

RUN npm run build

# Run phase
FROM nginx

#by default serves up anything in here so we copy build from previous image to this path. 
COPY --from=builder /app/build /usr/share/nginx/html

# default nginx command is going to start
