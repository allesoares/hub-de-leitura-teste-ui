FROM node:22.19.0-bookworm-slim

RUN apt-get update \
    && apt-get install -y --no-install-recommends git ca-certificates python3 make g++ \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

ARG HUB_COMMIT=5b69f92b763e50e3404778fb56c9c359793d37cb
RUN git init . \
    && git remote add origin https://github.com/EBAC-QE/hub-de-leitura-integrado.git \
    && git fetch --depth 1 origin ${HUB_COMMIT} \
    && git checkout --detach FETCH_HEAD \
    && npm ci --omit=dev \
    && mkdir -p database \
    && rm -f database/biblioteca.db \
    && npm run db \
    && rm -rf .git

ENV NODE_ENV=production \
    PORT=3000

EXPOSE 3000

CMD ["npm", "start"]
