const nome_produto = 'Sauce Labs Backpack';
const desc_produto = 'carry.allTheThings() with the sleek, streamlined Sly Pack that melds uncompromising style with unequaled laptop and tablet protection.';
const valor_produto = '29.99';


function logarNoSistema() { //Criei esse teste como uma funcao para que seja reutilizada nos outros testes
    cy.visit('https://saucedemo.com'); //Acessa a URL
    cy.get('input[id="user-name"]').type('standard_user'); //Adiciona o Login no campo com o id user-name
    cy.get('input[id="password"]').type('secret_sauce'); //Adciona a Senha no campo com o id secret-sauce
    cy.get('#login-button').click(); //Clica no botão com o id login-button
    cy.contains('Products').should('be.visible'); //Verifica se está na página de produtos
  }

function addProdutoNoCarrinho() { //Criei esse teste como uma funcao para que seja reutilizada nos outros testes
  cy.contains('[data-test="inventory-item-name"]', nome_produto) // Busca pelo produto com o nome Sauce Labs Backpack
    .parents('.inventory_item') //Encontra os parents desse elemento
    .find('.btn.btn_primary.btn_small.btn_inventory') //Encontra o botão parente desse elemento
    .click(); //Clica no botão para adicionar ao carrinho
  cy.get('[data-test="shopping-cart-link"]').contains('1'); //Valida se no ícone do carrinho aparece o número 1
  }

  export {
    logarNoSistema,
    addProdutoNoCarrinho,
    nome_produto,
    desc_produto,
    valor_produto
  };