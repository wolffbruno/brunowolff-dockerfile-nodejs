FROM node:18-alpine

RUN addgroup -S appgroup && adduser -S appuser -G appgroup

WORKDIR /usr/src/app

COPY package*.json ./

RUN npm i --omit=dev

COPY . .

RUN chown -R appuser:appgroup /usr/src/app

USER appuser

EXPOSE 8090

CMD ["npm", "start"]
