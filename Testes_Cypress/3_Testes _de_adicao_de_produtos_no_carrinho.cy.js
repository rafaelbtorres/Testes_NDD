import {logarNoSistema, addProdutoNoCarrinho, nome_produto, desc_produto, valor_produto} from './funcoesGlobais.js'; //Importa variaveis e funções reutilizaveis


describe('Validar se o produto é adicionado ao carrinho', () => {
  it('Aprovado', () => {
    logarNoSistema(); //Chama a função para fazer login no sistema
    addProdutoNoCarrinho(); // Chama a função para adicionar um produto ao carrinho
  })  
})


describe('Validar se o produto e a quantidade correta foram adicionados ao carrinho', () => {
  it('Aprovado', () => {
    logarNoSistema(); //Chama a função para fazer login no sistema
    addProdutoNoCarrinho(); // Chama a função para adicionar um produto ao carrinho
    cy.get('[data-test="shopping-cart-link"]').click(); //Clica no botão do carrinho
    cy.contains('Your Cart').should('be.visible'); //Verifica se está na página do carrinho
    cy.get('[data-test="item-quantity"]').contains('1'); //Valida se no campo de quantidade está a quantidade 1
    cy.get('[data-test="inventory-item-name"]').contains(nome_produto); //Valida se no campo do nome do produto está o nome correto do produto
    cy.get('[data-test="inventory-item-desc"]').contains(desc_produto); //Valida se o campo da descricao do produto está correta
    cy.get('[data-test="inventory-item-price"]').contains(valor_produto); //Valida se o valor do produto está correto
  })  
})


describe('APOS RELOGAR NO SISTEMA, confirmar se o produto e a quantidade correta foram adicionados ao carrinho.', () => {
  it('Aprovado', () => {
    logarNoSistema(); //Chama a função para fazer login no sistema
    addProdutoNoCarrinho(); // Chama a função para adicionar um produto ao carrinho
    cy.get('[data-test="shopping-cart-link"]').click(); //Clica no botão do carrinho
    cy.contains('Your Cart').should('be.visible'); //Verifica se está na página do carrinho
    cy.get('[data-test="item-quantity"]').contains('1'); //Valida se no campo de quantidade está a quantidade 1
    cy.get('[data-test="inventory-item-name"]').contains(nome_produto); //Valida se no campo do nome do produto está o nome correto do produto
    cy.get('[data-test="inventory-item-desc"]').contains(desc_produto); //Valida se o campo da descricao do produto está correta
    cy.get('[data-test="inventory-item-price"]').contains(valor_produto); //Valida se o valor do produto está correto

    //Repete o processo anterior após relogar no sistema
    cy.get('#react-burger-menu-btn').click(); //Abre o menu principal
    cy.get('[data-test="logout-sidebar-link"]').click(); //Clica no botão para fazer logout 
    logarNoSistema(); //Chama a função para fazer login no sistema
    cy.get('[data-test="shopping-cart-link"]').contains('1'); //Valida se no ícone do carrinho ainda aparece o número 1
    cy.get('[data-test="shopping-cart-link"]').click(); //Clica no botão do carrinho
    cy.contains('Your Cart').should('be.visible'); //Verifica se está na página do carrinho
    cy.get('[data-test="item-quantity"]').contains('1'); //Valida se no campo de quantidade está a quantidade 1
    cy.get('[data-test="inventory-item-name"]').contains(nome_produto); //Valida se no campo do nome do produto está o nome correto do produto
    cy.get('[data-test="inventory-item-desc"]').contains(desc_produto); //Valida se o campo da descricao do produto está correta
    cy.get('[data-test="inventory-item-price"]').contains(valor_produto); //Valida se o valor do produto está correto
  })  
})


