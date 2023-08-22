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
      img_count=self.links(id: /^item_(\d+)_img_link$/).count
      idx=0
      criteria = []
      while idx< img_count do
        src = link(id: /^item_#{idx}_img_link$/).child.attribute('src')
        uri                  = URI(src)
        res                  = Net::HTTP.get_response(uri)
        idx +=1
        criteria << res.code.to_i
      end
      criteria
    end
  end
end