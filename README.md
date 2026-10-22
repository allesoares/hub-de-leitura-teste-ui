# EBAC - Hub de Leitura — Módulo Automações de testes de UI

Projeto de estudo do módulo de automação de Cypress. 
Os testes verificam funcionalidades do site Hub de Leitura (projeto `hub-de-leitura-integrado`), com alguns cenários de sucesso e validação de erros.

## Tecnologias

- **JavaScript:** linguagem utilizada nos testes.
- **Cypress:** execução de testes de ponta a ponta (E2E) no navegador.
- **Faker:** geração de nomes e e-mails para os testes de cadastro.

## Pré-requisitos

- Node.js 22.13 ou superior da linha 22 e npm instalados.
- Java 17 ou superior no `PATH` para gerar e abrir o relatório Allure 2.
- Git
- Aplicação Hub de Leitura configurada e disponível em `http://localhost:3000/`.


## Iniciar o site localmente

Na organização local usada neste projeto, o site fica na pasta `C:\repositorio\hub-de-leitura-integrado`. Em um terminal separado, execute:

```powershell
cd C:\repositorio\hub-de-leitura-integrado
npm start
```


## Executar os testes

No terminal da pasta `hub-de-leitura-teste-ui`, abra a interface do Cypress:

```powershell
npx cypress open
```

Selecione **E2E Testing**, Electron para ver e acionar os testes.

Para executar todos os testes pelo terminal no Chrome, com a aplicação em execução e o navegador instalado:

```powershell
npm test
```

Para executar os testes no Chrome e registrar os resultados no Cypress Cloud, use o script `cy:report`:

```powershell
npm run cy:report
```

## Relatório Allure

Instalar dependencias : npm ci

```powershell
npm test
npm run report:generate
npm run report:open
```

## GitHub Actions

workflow `.github/workflows/teste-ci.yml` 


## Cenários implementados

| Arquivo | Cenários |
| --- | --- |
| `cadastro.cy.js` | Cadastro com e-mail gerado por data/hora; cadastro com dados do Faker, comando customizado e Page Object (`cadastro-page`), com validação do nome no dashboard; rejeição de senhas diferentes e de nome não preenchido. |
| `catalogo.cy.js` | Adição de livros à cesta por posição, por título e de todos os livros; validação do contador e conferência de títulos na cesta; acesso aos detalhes de Dom Casmurro, validação do título e autor e adição pela página de detalhes. |
| `catalogo-busca.cy.js` | Verificação de títulos não vazios no catálogo; busca por 1984; busca com massa de dados importada e com `cy.fixture`; busca e validação de todos os livros da massa de dados usando `forEach` e `cy.wrap().each()`. |
| `contato.cy.js` | Envio do formulário com sucesso; mensagens de erro ao deixar nome, e-mail, assunto ou mensagem sem preenchimento. |
| `login.cy.js` | Login de usuário com sucesso; login de administrador com comando customizado; login usando massa de dados de `usuario.json` e comando customizado; validação da mensagem de sucesso e do redirecionamento ao dashboard. |
