FROM node:20-alpine
WORKDIR /app

COPY ["Assignment 1 Files/package.json", "."]
COPY ["Assignment 1 Files/package-lock.json", "."]

RUN npm ci --only=production

COPY ["Assignment 1 Files/.", "."]

ENV PORT=8080
EXPOSE 8080
CMD ["npm", "start"]
