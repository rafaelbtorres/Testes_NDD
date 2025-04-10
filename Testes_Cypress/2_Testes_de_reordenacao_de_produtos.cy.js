import { logarNoSistema } from './funcoesGlobais.js'; //Importa a função logarNoSistema


describe('Validar se os produtos aparecem corretamente na tela', () => {
  it('Aprovado', () => {
    logarNoSistema(); //Chama a função para fazer login no sistema
    cy.get('[data-test="item-4-img-link"]').should('be.visible') //Verifica se a imagem do produto aparece na tela   
    cy.get('.inventory_item_name').then(($els) => { //Pega todos os produtos que tem a classe inventory_item_name
      const nomes = [...$els].map(el => el.innerText.trim()); //Adiciona todos os produtos em um array
      expect(nomes.length).to.be.greaterThan(0); // Verifica se possui pelo menos 1 produto sendo listado
    });
    cy.get('[data-test="inventory-item-name"]').should('be.visible') //Verifica se o nome do produto aparece na tela
    cy.get('[data-test="inventory-item-desc"]').should('be.visible') //Verifica se a descricao do produto aparece na tela
    cy.get('[data-test="inventory-item-price"]').should('be.visible') //Verifica se o preco do produto aparece na tela 
  })
})


describe('Realizar a ordenacao dos produtos de A a Z', () => {
  it('Aprovado', () => {
    logarNoSistema(); //Chama a função para fazer login no sistema
    cy.get('[data-test="product-sort-container"]').select('az'); //Ordena os produtos de A a Z utilizando o value do html
    cy.get('.inventory_item_name').then(($els) => { //Pega todos os produtos que tem a classe inventory_item_name
      const nomes = [...$els].map(el => el.innerText.trim()); //Adiciona todos os produtos em um array
      const ordenado = [...nomes].sort(); //Ordena os produtos do A a Z
      expect(nomes).to.deep.equal(ordenado); //Verifica se os produtos ordenados na web estão iguais aos ordenados no mapa
    });
  })
})


describe('Realizar a ordenacao dos produtos de Z a A', () => {
  it('Aprovado', () => {
    logarNoSistema(); //Chama a função para fazer login no sistema
    cy.get('[data-test="product-sort-container"]').select('za'); //Ordena os produtos de Z a A utilizando o value do html
    cy.get('.inventory_item_name').then(($els) => { //Pega todos os produtos que tem a classe inventory_item_name
      const nomes = [...$els].map(el => el.innerText.trim()); //Adiciona todos os produtos em um array
      const ordenado = [...nomes].sort().reverse(); //Ordena os produtos do Z a A
      expect(nomes).to.deep.equal(ordenado); //Verifica se os produtos ordenados na web estão iguais aos ordenados no mapa
    });
  })
})


