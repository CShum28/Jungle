/// <reference types="cypress" />

describe("Home page tests", () => {
  it("There is products on the page", () => {
    cy.visit("/");
    cy.get(".products article").should("be.visible");
  });

  it("There is 2 products on the page", () => {
    cy.get(".products article").should("have.length", 2);
  });

  it("Add product to cart", () => {
    cy.get(".products").contains("Scented Blade");
    cy.get(".btn").contains("Add").click({ force: true });
  });

  it("Cart now shows 1", () => {
    cy.get(".navbar-nav li").contains("My Cart (1)");
  });
});
