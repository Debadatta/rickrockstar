@products
Feature: Products
  In order to have products on my website
  As an administrator
  I want to manage products

  Background:
    Given I am a logged in refinery user
    And I have no products

  @products-list @list
  Scenario: Products List
   Given I have products titled UniqueTitleOne, UniqueTitleTwo
   When I go to the list of products
   Then I should see "UniqueTitleOne"
   And I should see "UniqueTitleTwo"

  @products-valid @valid
  Scenario: Create Valid Product
    When I go to the list of products
    And I follow "Add New Product"
    And I fill in "Title" with "This is a test of the first string field"
    And I press "Save"
    Then I should see "'This is a test of the first string field' was successfully added."
    And I should have 1 product

  @products-invalid @invalid
  Scenario: Create Invalid Product (without title)
    When I go to the list of products
    And I follow "Add New Product"
    And I press "Save"
    Then I should see "Title can't be blank"
    And I should have 0 products

  @products-edit @edit
  Scenario: Edit Existing Product
    Given I have products titled "A title"
    When I go to the list of products
    And I follow "Edit this product" within ".actions"
    Then I fill in "Title" with "A different title"
    And I press "Save"
    Then I should see "'A different title' was successfully updated."
    And I should be on the list of products
    And I should not see "A title"

  @products-duplicate @duplicate
  Scenario: Create Duplicate Product
    Given I only have products titled UniqueTitleOne, UniqueTitleTwo
    When I go to the list of products
    And I follow "Add New Product"
    And I fill in "Title" with "UniqueTitleTwo"
    And I press "Save"
    Then I should see "There were problems"
    And I should have 2 products

  @products-delete @delete
  Scenario: Delete Product
    Given I only have products titled UniqueTitleOne
    When I go to the list of products
    And I follow "Remove this product forever"
    Then I should see "'UniqueTitleOne' was successfully removed."
    And I should have 0 products
 