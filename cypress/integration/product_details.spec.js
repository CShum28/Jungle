/// <reference types="cypress" />

describe("Product details page tests", () => {
  it("Visit the home page", () => {
    cy.visit("/");
    cy.get(".products article").should("be.visible");
  });

  it("There is 2 products on the page", () => {
    cy.get(".products article").should("have.length", 2);
  });

  it("Take you to product detail page by clicking a product", () => {
    cy.get(".products").contains("Scented Blade").click();
  });
});
