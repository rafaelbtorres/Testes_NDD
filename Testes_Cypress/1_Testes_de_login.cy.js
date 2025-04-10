import { logarNoSistema } from './funcoesGlobais.js'; //Importa a função logarNoSistema


describe('Validar login com usuario e senha corretos', () => {
  it('Aprovado', () => {
    logarNoSistema(); //Chama a função para fazer login no sistema
  })
})


describe('Validar login com usuario errado', () => {
  it('Aprovado', () => {
    cy.visit('https://saucedemo.com'); //Acessa a URL
    cy.get('input[id="user-name"]').type('admin'); //Adiciona o Login ERRADO no campo com o id user-name
    cy.get('input[id="password"]').type('secret_sauce'); //Adciona a Senha no campo com o id secret-sauce
    cy.get('#login-button').click(); //Clica no botão com o id login-button
    cy.get('[data-icon="times-circle"]').should('be.visible');//Verifica se o ícone de erro aparece na tela
    cy.get('[data-test="error"]').should('be.visible')//Verifica se a mensagem de erro está aparece na tela
    .and('contain.text', 'Epic sadface: Username and password do not match any user in this service'); //Verifica se o texto da mensagem de erro está correto
  })
})


describe('Validar login com senha errada', () => {
  it('Aprovado', () => {
    cy.visit('https://saucedemo.com'); //Acessa a URL
    cy.get('input[id="user-name"]').type('standard_user'); //Adiciona o Login no campo com o id user-name
    cy.get('input[id="password"]').type('rafa123'); //Adciona a Senha ERRADA no campo com o id secret-sauce
    cy.get('#login-button').click(); //Clica no botão com o id login-button
    cy.get('[data-icon="times-circle"]').should('be.visible');//Verifica se o ícone de erro aparece na tela
    cy.get('[data-test="error"]').should('be.visible')//Verifica se a mensagem de erro está aparece na tela
    .and('contain.text', 'Epic sadface: Username and password do not match any user in this service'); //Verifica se o texto da mensagem de erro está correto
  })
})


describe('Validar login com usuario bloqueado', () => {
  it('Aprovado', () => {
    cy.visit('https://saucedemo.com'); //Acessa a URL
    cy.get('input[id="user-name"]').type('locked_out_user'); //Adiciona o Login de usuário BLOQUEADO no campo com o id user-name
    cy.get('input[id="password"]').type('secret_sauce'); //Adciona a Senha no campo com o id secret-sauce
    cy.get('#login-button').click(); //Clica no botão com o id login-button
    cy.get('[data-icon="times-circle"]').should('be.visible');//Verifica se o ícone de erro aparece na tela
    cy.get('[data-test="error"]').should('be.visible')//Verifica se a mensagem de erro está aparece na tela
    .and('contain.text', 'Epic sadface: Sorry, this user has been locked out.'); //Verifica se o texto da mensagem de erro está correto
  })
})