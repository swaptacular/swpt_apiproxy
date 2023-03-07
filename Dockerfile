FROM node:18.14.2-alpine3.16

ENV NODE_ENV=production

WORKDIR /usr/src/app
COPY --chown=node:node server.js package.json package-lock.json ./

RUN apk add --no-cache dumb-init \
    && npm ci --only=production
USER node

EXPOSE 8080
CMD ["dumb-init", "node", "server.js"]
