# Hub de Leitura com Cypress

Este foi o projeto em que comecei a automatizar os testes de interface do curso da EBAC. Usei o Hub de Leitura para testar cadastro, login, contato e consulta ao catálogo. Conforme avancei, passei a organizar os testes com fixtures, comandos customizados, Faker e Page Objects.

**Tecnologias:** Cypress, JavaScript, Node.js e Allure.

## O que vale olhar

- [Cenários de interface](cypress/e2e): fluxos positivos, validações de campos e consulta de livros.
- [Comandos reutilizados](cypress/support/commands.js) e [Page Object de cadastro](cypress/support/pages/cadastro-page.js).
- [Pipeline do GitHub Actions](.github/workflows/teste-ci.yml): prepara a aplicação, executa os testes e publica o Allure.

## Como executar localmente

É necessário ter Node.js e npm compatíveis com as dependências do projeto, Chrome e o [Hub de Leitura integrado](https://github.com/EBAC-QE/hub-de-leitura-integrado) em execução em `http://localhost:3000`. Instale e inicie a aplicação conforme o README dela. Os testes usam as contas de demonstração e o catálogo do ambiente de aula.

Na pasta deste projeto:

```powershell
npm ci
npm test
```

Para abrir o Cypress, execute `npx cypress open`. Para consultar o Allure, com Java disponível:

```powershell
npm run report:generate
npm run report:open
```

## Integração contínua

Na `main`, o workflow executa por push e também pode ser iniciado manualmente. Ele obtém a aplicação, prepara o banco de teste, executa o Cypress e publica o relatório Allure no GitHub Pages.

## Docker

O mesmo projeto foi usado nos exercícios de containers. As configurações são diferentes em cada branch:

- [main](https://github.com/allesoares/hub-de-leitura-teste-ui/tree/main): Dockerfile com aplicação e testes na mesma imagem.
- [exercicio-20-docker-compose](https://github.com/allesoares/hub-de-leitura-teste-ui/tree/exercicio-20-docker-compose): aplicação e testes em serviços separados.

### Executar esta branch com Docker Compose

Com Docker Desktop em execução no modo de containers Linux e Git instalado, execute na raiz do projeto:

```powershell
docker compose up --build --abort-on-container-exit --exit-code-from testes
```

O serviço `testes` aguarda o healthcheck da aplicação e acessa `http://app:3000`. Os relatórios, screenshots e vídeos ficam em `artifacts/compose/`. O Compose não publica a aplicação em uma porta do computador; o acesso ocorre pela rede dos containers.

Há também uma [imagem da aplicação no Docker Hub](https://hub.docker.com/r/allesoaresdocker/hub-de-leitura-app/tags), com a tag `exercicio-20`:

```powershell
docker pull allesoaresdocker/hub-de-leitura-app:exercicio-20
```

## Contexto

Exercício desenvolvido por Alexandre Soares durante o curso da EBAC, com a aplicação e os exemplos fornecidos nas aulas.

[Voltar ao portfólio](https://github.com/allesoares/qa-portfolio)
