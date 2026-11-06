# Node e navegadores com versões fixas para o exercício.
FROM cypress/browsers:node-22.19.0-chrome-139.0.7258.154-1-ff-142.0.1-edge-139.0.3405.125-1

# Java gera o relatório HTML do Allure.
RUN apt-get update \
    && apt-get install -y --no-install-recommends default-jre-headless procps \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /tests

# Instala primeiro as dependências para aproveitar o cache do Docker.
COPY package.json package-lock.json ./
RUN npm ci

COPY . .

# Limpa os resultados anteriores, executa os testes e gera o relatório.
CMD ["sh", "-c", "rm -rf /tests/allure-results/* && npm test && npm run report:generate"]
