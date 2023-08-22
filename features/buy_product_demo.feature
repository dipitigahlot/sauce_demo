@logout @buy_product
Feature: Buy Product And Make Payment
  As a Buyer, I want to login to the saucedemo app, add some product then buy product and make payment.

  @a
  Scenario Outline: Login To Product Page
  As a Buyer, I want to login to the app and confirm correct page is displayed.
    When I launch the browser and log in to 'saucedemo' as User '<user>' with password '<password>'
    Then I should be on the 'Products' page
    And I should see page displayed without error

    Examples:
      | user                    | password     |
      | locked_out_user         | secret_sauce |
      | problem_user            | secret_sauce |
      | performance_glitch_user | secret_sauce |
      | standard_user           | secret_sauce |

  @login @b
  Scenario: Add To Basket And Buy Product
    Given I should be on the 'Products' page
    When I add following product to the cart:
      | product               |
      | Sauce Labs Backpack   |
      | Sauce Labs Bike Light |
      | Sauce Labs Onesie     |
    And I click the 'Cart' link
    Then I should be on the 'Your Cart' page
    And I should see '3' items in the cart
    When I remove 'Sauce Labs Backpack' product from the cart
    And I should see '2' items in the cart

  @login @c
  Scenario: Make Order And Pay
    Given I should be on the 'Products' page
    When I add following product to the cart:
      | product               |
      | Sauce Labs Backpack   |
      | Sauce Labs Bike Light |
    And I click the 'Cart' link
    Then I should be on the 'Your Cart' page
    And I should see '2' items in the cart
    When I click the 'checkout' button
    Then I should be on the 'Checkout Your Information' page
    When I set these text field with following values and press the 'Tab' key:
      | field           | value  |
      | First Name      | Dipiti |
      | Last Name       | Gahlot |
      | Zip/Postal Code | 201304 |
    And I click the 'Continue' button
    Then I should be on the 'Checkout Overview' page
    And I should see the 'Total Cart' amount is between '30' and '60'
    And I click the 'Finish' button