# @example
#  I should see page displayed without error
And("I should see page displayed without error") do
  res_code = @current_page.correct_image_displayed?
  success = true
  res_code.each do |arr|
    if arr != 200
      success = false
      break
    end
  end
  assert(success, "Possible Defect: page was not loaded correctly")
end

# @example
#  I add following product to the cart:
#   |product|
#   |       |
When /^I (add|remove) following product to the cart:$/ do |action, table|
  raise ArgumentError, "No DataTable provided. This step only accepts DataTables." if table.nil?

  fields = table.symbolic_hashes.flat_map(&:values)
  fields.each { |field| step "I #{action} '#{field}' product to the cart" }
end

# @example
#  I add 'Sauce Labs Backpack' product to the cart
#  I remove 'Sauce Labs Backpack' product from the cart
When /^I (add|remove) '(.*)' product (?:to|from)? the cart$/ do |action, product|

  case action
  when 'add'
    @current_page.add_to_cart(product)
  when 'remove'
    @current_page.remove_from_cart(product)
  else
    raise ArgumentError, "Action not supported by this step: #{action}"
  end

end

# @example
#  I click the 'Cart' link
When /^I click the '(.*)' (?:link|button)?$/ do |label|
  poe = @current_page.page_object_name(label)
  el = @current_page.send poe # PageObject::Element

  el.click
end

# @example
#  I should see '2' items in the cart
And /^I should see '(\d+)' items in the cart$/ do |count|
  actual_count = @current_page.item_count

  assert_equal(count, actual_count, "Possible Defect: no of items in the care are not correct")
end

# I set these text field with following values and press the 'Tab' key:
#     | field         | value    |
#     | First Name  | Dipiti    |
#     | Last Name | Gahlot     |
When /^I set these text field with following values(?: and press the '(.+)' key)?:$/ do |event, *table|
  raise ArgumentError, "No DataTable provided. This step only accepts DataTables." unless table.any?

  table[0].symbolic_hashes.each do |hash|
    if event
      step "I set the '#{hash[:field]}' text field as '#{hash[:value]}' and press the '#{event}' key"
    else
      step "I set the '#{hash[:field]}' text field as '#{hash[:value]}'"
    end
  end
end

# @example
#   I set the 'First Name' text field as 'Dipiti' and press the 'Tab' key
#   I set the 'First Name' text field as 'Dipiti'
When /^I set the '(.+)' text field as '(.*)'(?: and press the '(.+)' key)?$/ do |field, val, event|
  poe = @current_page.page_object_name(field)
  el = @current_page.send poe # PageObject::Element

  el.send_keys val
  if event
    el.send_keys :tab
  end
end

# @example
# And I should see the 'total cart' amount is between '30' and '60'
And /^I should see the '(.*)' amount is between '(\d+)' and '(\d+)'$/ do |field, min, max|
  poe = @current_page.page_object_name(field)
  el = @current_page.send poe # PageObject::Element
  actual_count = el.text.split('$').last.to_i

  assert((min..max) === actual_count, "Possible Defect: cart amount is not in the range")
end
