import {logarNoSistema, addProdutoNoCarrinho, nome_produto, desc_produto, valor_produto} from './funcoesGlobais.js'; //Importa variaveis e funções reutilizaveis


describe('Validar se o processo de finalização da compra funciona como esperado', () => {
  it('Aprovado', () => {
    logarNoSistema(); //Chama a função para fazer login no sistema
    addProdutoNoCarrinho(); // Chama a função para adicionar um produto ao carrinho
    cy.get('[data-test="shopping-cart-link"]').click(); //Clica no botão do carrinho
    cy.contains('Your Cart').should('be.visible'); //Verifica se está na página do carrinho
    cy.get('[data-test="item-quantity"]').contains('1'); //Valida se no campo de quantidade está a quantidade 1
    cy.get('[data-test="inventory-item-name"]').contains(nome_produto); //Valida se no campo do nome do produto está o nome correto do produto
    cy.get('[data-test="inventory-item-desc"]').contains(desc_produto); //Valida se o campo da descricao do produto está correta
    cy.get('[data-test="inventory-item-price"]').contains(valor_produto); //Valida se o valor do produto está correto
    
    //Processo de checkout
    cy.get('[data-test="checkout"]').click(); //Clica no botão do checkout
    cy.contains('Checkout: Your Information').should('be.visible'); //Verifica se está na página do checkout
    cy.get('[data-test="firstName"]').type('Rafael'); //Prenche o campo First Name com o primeiro nome
    cy.get('[data-test="lastName"]').type('Barboza Torres'); //Prenche o campo Last Name com o segundo nome
    cy.get('[data-test="postalCode"]').type('88119305'); //Prenche o campo Postal code com o CEP

    //Processo final
    cy.get('[data-test="continue"]').click(); //Clica no botão continue
    cy.contains('Checkout: Overview').should('be.visible'); //Verifica se está na página do checkout
    cy.get('[data-test="item-quantity"]').contains('1'); //Valida se no campo de quantidade está a quantidade 1
    cy.get('[data-test="inventory-item-name"]').contains(nome_produto); //Valida se no campo do nome do produto está o nome correto do produto
    cy.get('[data-test="inventory-item-desc"]').contains(desc_produto); //Valida se o campo da descricao do produto está correta
    cy.get('[data-test="inventory-item-price"]').contains(valor_produto); //Valida se o valor do produto está correto
    cy.get('[data-test="finish"]').click(); //Clica no botão finish
    cy.contains('Checkout: Complete!').should('be.visible'); //Verifica se está na página final
    cy.get('[data-test="pony-express"]').should('be.visible'); //Verifica se a imagem de conclusão está visivel
    cy.get('[data-test="complete-header"]').contains('Thank you for your order!'); //Valida se o header está correto
    cy.get('[data-test="complete-text"]').contains('Your order has been dispatched, and will arrive just as fast as the pony can get there!'); //Valida se o texto está correto
    cy.get('[data-test="back-to-products"]').contains('Back Home'); //Valida se o botão de retorno está
    
    //Validar carrinho vazio
    cy.get('[data-test="shopping-cart-link"]').click(); //Clica no botão do carrinho
    cy.contains('Your Cart').should('be.visible'); //Verifica se está na página do carrinho
    cy.get('[data-test="item-quantity"]').should('not.exist'); //Verifica se o campo quantidade do produto não existe no carrinho
    cy.get('[data-test="inventory-item-name"]').should('not.exist'); //Verifica se o campo nome do produto não existe no carrinho
    cy.get('[data-test="inventory-item-desc"]').should('not.exist'); //Verifica se o campo descricao do produto não existe no carrinho
    cy.get('[data-test="inventory-item-price"]').should('not.exist'); //Verifica se o campo preço do produto não existe no carrinho    
  })
})


describe('Validar se os campos do checkout são validados corretamente', () => {
  it('Aprovado', () => {
    logarNoSistema(); //Chama a função para fazer login no sistema
    addProdutoNoCarrinho(); // Chama a função para adicionar um produto ao carrinho
    cy.get('[data-test="shopping-cart-link"]').click(); //Clica no botão do carrinho
    cy.contains('Your Cart').should('be.visible'); //Verifica se está na página do carrinho
    cy.get('[data-test="item-quantity"]').contains('1'); //Valida se no campo de quantidade está a quantidade 1
    cy.get('[data-test="inventory-item-name"]').contains(nome_produto); //Valida se no campo do nome do produto está o nome correto do produto
    cy.get('[data-test="inventory-item-desc"]').contains(desc_produto); //Valida se o campo da descricao do produto está correta
    cy.get('[data-test="inventory-item-price"]').contains(valor_produto); //Valida se o valor do produto está correto
    
    //Validar campos do checkout
    cy.get('[data-test="checkout"]').click(); //Clica no botão do checkout
    cy.contains('Checkout: Your Information').should('be.visible'); //Verifica se está na página do checkout
    cy.get('[data-test="continue"]').click(); //Clica no botão continue com o primeiro nome vazio
    cy.get('[data-test="error"]').contains('Error: First Name is required');
    cy.get('[data-test="firstName"]').type('Rafael'); //Prenche o campo First Name com o primeiro nome
    cy.get('[data-test="continue"]').click(); //Clica no botão continue com o segundo nome vazio
    cy.get('[data-test="error"]').contains('Error: Last Name is required');
    cy.get('[data-test="lastName"]').type('Barboza Torres'); //Prenche o campo First Name com o segundo nome
    cy.get('[data-test="continue"]').click(); //Clica no botão continue com o postal code vazio
    cy.get('[data-test="error"]').contains('Error: Postal Code is required');
    cy.get('[data-test="postalCode"]').type('88119305'); //Prenche o campo Postal code com o CEP 
  })
})