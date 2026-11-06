# Hub de Leitura - Testes UI

Projeto de estudo da EBAC com testes automatizados em Cypress e relatórios Allure.

## Exercício 20 - Docker Compose

Pré-requisitos: Docker Desktop em execução com containers Linux e Git.

O Compose inicia dois serviços: `app` (Hub de Leitura com SQLite) e `testes` (Cypress). Os testes aguardam a aplicação ficar pronta e acessam `http://app:3000` pela rede dos containers.

Para construir as imagens e executar os testes:

```powershell
docker compose up --build --abort-on-container-exit --exit-code-from testes
```

Os relatórios, screenshots e vídeos ficam em `artifacts/compose/` e são atualizados a cada execução.

Para capturar a evidência no Docker Desktop, abra o grupo `hub-de-leitura-teste-ui`, selecione o container `testes` e acesse **Logs**. O resumo final do Cypress mostra o resultado dos testes. Os logs de `app` mostram a inicialização da aplicação.

Depois de capturar a evidência, remova os containers para a próxima execução começar com um banco novo:

```powershell
docker compose down
```

## Bônus - Docker Hub

Imagem da aplicação publicada no [Docker Hub](https://hub.docker.com/r/allesoaresdocker/hub-de-leitura-app/tags), com a tag `exercicio-20`.

```powershell
docker pull allesoaresdocker/hub-de-leitura-app:exercicio-20
```

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
