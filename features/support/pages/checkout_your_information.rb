module Pages
  class CheckoutYourInformation < Application
    span(:page_loaded, text: 'Checkout: Your Information', visible: true)
    text_field(:first_name, id: 'first-name')
    text_field(:last_name, id: 'last-name')
    text_field(:zip_postal_code, id: 'postal-code')
    button(:continue, id: 'continue', visible: true)
  end
end