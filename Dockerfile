FROM node:18.20.4-alpine3.19 AS app-image

ENV NODE_ENV=production

WORKDIR /usr/src/app
COPY --chown=node:node server.js package.json package-lock.json ./

RUN apk add --no-cache dumb-init \
    && npm ci --only=production
USER node

EXPOSE 8080
CMD ["dumb-init", "node", "server.js"]
