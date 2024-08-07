# Dockerfile for the react app
FROM node:slim
WORKDIR /app
COPY package*.json /app
RUN npm ci
COPY . /app
EXPOSE 3000
CMD ["npm", "start"]