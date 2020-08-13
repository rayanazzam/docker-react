# builder phase
FROM node:alpine

WORKDIR '/app'

COPY package.json .

RUN npm install

COPY . .

RUN npm run build

# Run phase
FROM nginx
# Elasticbean looks at this
EXPOSE 80
#by default serves up anything in here so we copy build from previous image to this path. 
COPY --from=0 /app/build /usr/share/nginx/html

# default nginx command is going to start

