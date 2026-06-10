FROM node:18-alpine AS base

WORKDIR /usr/src/app

COPY package*.json ./
RUN npm ci --omit=dev && npm cache clean --force

COPY . .

FROM node:18-alpine AS runtime

WORKDIR /usr/src/app

RUN addgroup -S app && adduser -S app -G app

ENV NODE_ENV=production

COPY --from=base /usr/src/app/package*.json ./
COPY --from=base /usr/src/app/node_modules ./node_modules
COPY --from=base /usr/src/app/app.js ./

RUN chown -R app:app /usr/src/app

USER app

EXPOSE 3000

CMD ["node", "app.js"]
