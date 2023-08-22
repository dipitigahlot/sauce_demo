module Pages
  class Products < Application
    span(:page_loaded, text: 'Products', visible: true)
    link(:cart, class: 'shopping_cart_link')
    image(:product_image, class: 'inventory_item_img')

    # Adds product to the cart
    def add_to_cart(product)
      link(text: product, visible: true).parent.next_sibling.button.click
    end

    def correct_image_displayed?
      (self.image.attribute('src').include? 'sl-404') ? false : true
    end
  end
end