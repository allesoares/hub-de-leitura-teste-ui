# Hub de Leitura - Testes UI

Projeto de estudo da EBAC com testes automatizados em Cypress e relatórios Allure.

## Exercício 20 - Docker Compose

## Bônus - Docker Hub

Imagem da aplicação publicada no [Docker Hub](https://hub.docker.com/r/allesoaresdocker/hub-de-leitura-app/tags), com a tag `exercicio-20`.

## Execução local

Com a aplicação disponível em `http://localhost:3000`:

```powershell
npm ci
npm test
```

Para gerar e abrir o relatório Allure, com Java instalado:

```powershell
npm run report:generate
npm run report:open
```
