# @example
#   I launch the browser and log in to 'saucedemo' as User 'standard_user' with password 'secret_sauce'
#
Given(/^I launch the browser and log in to '(.*)' as(?: a)? User '([A-Za-z0-9\-_]+)' with password '([A-Za-z0-9\-_]+)'$/) do |app, username, password|
  # Launch browser
  @browser =  Watir::Browser.new $configs.browser_name

  # Initialize app specific class which will then set @current_page
  set_current_page('Login')

  # Navigate to login page to log in
  @browser.goto $configs.url
  @browser.window.maximize
  success = @current_page.login_with username, password
  assert(success, "Possible Defect: user not logged in successfully, check user and password")
end

# @example
#  I should be on the 'Products' page
#
And /^I should( not)? be on the '(\D.+)' page$/ do |negate, page|
  namespace = on(Pages::NamespaceBuilder).build_namespace('Pages', page)
  visit(namespace)

  correct_view = @current_page.page_loaded_element.wait_until(&:present?).present?

  # Verify the expected page is loaded
  if negate
    refute(correct_view, "Possible defect: #{page} was unexpectedly active.")
  else
    assert(correct_view, "Possible defect: Expected #{page}  was not active.")
  end
end