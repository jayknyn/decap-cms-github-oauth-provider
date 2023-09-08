# building arm64v8 image for OCI A.1
FROM arm64v8/node:18-alpine
# FROM node:lts-alpine3.10

WORKDIR /usr/src/app

COPY package*.json ./

RUN npm ci --omit=dev

# Bundle app source
COPY . .

ENV NODE_ENV=production
ENV PORT=3000

EXPOSE 3000
CMD [ "npm", "start" ]

# docker build -f Dockerfile -t jayknyn/decap-cms-oauth:arm64v8 .

# docker push jayknyn/decap-cms-oauth:arm64v8