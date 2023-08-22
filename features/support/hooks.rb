
Before do |scenario|
  # Global Configurations
  $configs = OpenStruct.new
  $configs.browser_name = ENV.fetch('BROWSER', 'firefox').downcase # Downcase user input to match Watir expected case
  $configs.https_on = ENV.fetch('HTTPS_ON', true)
  $configs.url = ENV.fetch('URL', 'https://www.saucedemo.com')
  $configs.username = ENV.fetch('USER_NAME', 'standard_user') # Should be explicitly provided for each run
  $configs.password = ENV.fetch('PASSWORD', 'secret_sauce')
  $configs.logged_in = false # Set to true on a successful login

  DataMagic.load_for_scenario(scenario)

  # for latest version of chrome
  case $configs.browser_name
  when 'chrome'
    url                                       = "#{Webdrivers::Chromedriver.base_url}/LATEST_RELEASE"
    uri                                       = URI(url)
    Webdrivers::Chromedriver.required_version = Net::HTTP.get(uri)
  end

  @browser = Watir::Browser.new $configs.browser_name
end

Before('@login') do
  # Launch Browser
  @browser =  Watir::Browser.new $configs.browser_name

  # Navigate to URL
  @browser.goto $configs.url
  @browser.window.maximize

  # Initialize app specific class which will then set @current_page
  set_current_page('Login')

  $configs.logged_in = @current_page.login_with($configs.username, $configs.password)
  # raise 'Failed to successfully login.' unless $configs.logged_in
end # Before('@login')

After('@logout') do |scenario|
  set_current_page('Application')

  # Log out and kill browser after a failed execution.
  if $configs.logged_in # Do not attempt logout if login failed earlier
    @current_page.log_out
    $configs.logged_in = false
  end

  # Close browser
  @browser.close
end # After('@logout')