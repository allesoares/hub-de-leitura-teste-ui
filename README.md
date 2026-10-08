# EBAC - Hub de Leitura — Módulo Automações de testes de UI

Projeto de estudo do módulo de automação de Cypress. 
Os testes verificam funcionalidades do site Hub de Leitura (projeto projeto `hub-de-leitura-integrado`), com alguns cenários de sucesso e validação de erros.

## Tecnologias

- **JavaScript:** linguagem utilizada nos testes.
- **Cypress:** execução de testes de ponta a ponta (E2E) no navegador.
- **Faker:** geração de nomes e e-mails para os testes de cadastro.

## Pré-requisitos

- Node.js e npm instalados, em versões compatíveis com as dependências do projeto.
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

## Cenários implementados

| Arquivo | Cenários |
| --- | --- |
| `cadastro.cy.js` | Cadastro com e-mail gerado por data/hora; cadastro com dados do Faker e validação do nome no dashboard; rejeição de senhas diferentes. |
| `catalogo.cy.js` | Adição de livros à cesta por posição e por título; conferência de títulos na cesta; acesso aos detalhes de Dom Casmurro e adição pela página de detalhes; verificação de títulos não vazios no catálogo. |
| `contato.cy.js` | Envio do formulário com sucesso; mensagens de erro ao deixar nome, e-mail, assunto ou mensagem sem preenchimento. |
