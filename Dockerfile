# Node e navegadores com versões fixas para o exercício.
FROM cypress/browsers:node-22.19.0-chrome-139.0.7258.154-1-ff-142.0.1-edge-139.0.3405.125-1

# Java gera o relatório HTML do Allure; Git baixa a aplicação de teste.
RUN apt-get update \
    && apt-get install -y --no-install-recommends default-jre-headless git procps \
    && rm -rf /var/lib/apt/lists/*

# A aplicação fica dentro da imagem, sem depender do servidor do computador.
ARG HUB_COMMIT=5b69f92b763e50e3404778fb56c9c359793d37cb
RUN git init /opt/hub-de-leitura \
    && cd /opt/hub-de-leitura \
    && git remote add origin https://github.com/EBAC-QE/hub-de-leitura-integrado.git \
    && git fetch --depth 1 origin ${HUB_COMMIT} \
    && git checkout --detach FETCH_HEAD \
    && npm ci --omit=dev \
    && rm -f database/biblioteca.db \
    && npm run db \
    && rm -rf .git

WORKDIR /tests

# Instala primeiro as dependências para aproveitar o cache do Docker.
COPY package.json package-lock.json ./
RUN npm ci

COPY . .

ENV NODE_ENV=production \
    PORT=3000

# Executa os testes e, se passarem, gera o relatório usando os scripts npm.
CMD ["sh", "-c", "npm run test:docker && npm run report:generate"]
