import { faker } from '@faker-js/faker';

describe('Funcionalidade: Cadastro no Hub de Leitura', () => {
    beforeEach(() => {
        cy.visit('register.html');
    });

    it('Deve preencher o formulário de cadastro com sucesso, usando JS', () => {
        let timestamp = Date.now()
        let email = `alexandre+${timestamp}@teste.com`
        cy.get('#name').type('Alexandre')
        cy.get('#email').type(email)
        cy.get('#phone').type('11999999999')
        cy.get('#password').type('senha123')
        cy.get('#confirm-password').type('senha123')
        cy.get('#terms-agreement').check()
        cy.get('#register-btn').click()
        cy.url().should('include', '/dashboard.html')
    });

    it('Deve preencher o formulário de cadastro com sucesso, usando Faker', () => {
        let email = faker.internet.email()
        let name = faker.person.fullName()
        cy.get('#name').type(name)
        cy.get('#email').type(email)
        cy.get('#phone').type('11999999999')
        cy.get('#password').type('senha123')
        cy.get('#confirm-password').type('senha123')
        cy.get('#terms-agreement').check()
        cy.get('#register-btn').click()
        //Resultado esperado: redirecionamento para a página de dashboard
        cy.url().should('include', '/dashboard.html')
        cy.get('#user-name').should('contain.text', name)
    });

    it('Não deve cadastrar quando as senhas forem diferentes', () => {
        cy.get('#name').type('Alexandre')
        cy.get('#email').type('alexandre@teste.com')
        cy.get('#phone').type('11999999999')
        cy.get('#password').type('senha123')
        cy.get('#confirm-password').type('senha456')
        cy.get('#terms-agreement').check()
        cy.get('#register-btn').click()
        // Resultado esperado: mensagem de erro e permanência no cadastro
        cy.contains('Senhas não coincidem').should('be.visible')
        cy.url().should('include', '/register.html')
    });

});
