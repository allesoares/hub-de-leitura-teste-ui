describe('Funcionalidade: Login no Hub de Leitura', () => {
    beforeEach(() => {
        //Pagina de login
        cy.visit('login.html');
    });


    it('Deve fazer login com sucesso', () => {
        cy.get('#email').type('usuario@teste.com');
        cy.get('#password').type('user123');
        cy.get('#login-btn').click();
        cy.get('#alert-container').should('contain', 'Login realizado com sucesso!');
        cy.url().should('include', 'dashboard');
    });

    it('Deve fazer login com sucesso usando o comando personalizado', () => {
        cy.login('usuario@teste.com', 'user123');
    });

});
