module Pages
  class CheckoutOverview < Application
    span(:page_loaded, text: 'Checkout: Overview', visible: true)
    div(:total_cart, class: 'summary_info_label summary_total_label')
    button(:cancel, id: 'cancel', visible: true)
    button(:finish, id: 'finish', visible: true)
  end
end