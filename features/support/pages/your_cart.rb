module Pages
  class YourCart < Application
    span(:page_loaded, text: 'Your Cart')
    button(:remove) { link(text: /(.+)/, visible: true).parent.next_sibling.button }
    button(:checkout, id: 'checkout', visible: true)

    # This method Removes from the Cart
    def remove_from_cart(product)
      link(text: product, visible: true).next_sibling.next_sibling.button(id: 'remove-sauce-labs-backpack').click
    end

    # This method counts added items
    def item_count
      divs(class: 'cart_item').count
    end
  end
end