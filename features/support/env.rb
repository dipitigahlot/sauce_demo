require 'rubygems'

require 'rspec'
require 'watir'
require 'webdrivers'
require 'selenium-webdriver'
require 'page-object'
require 'nokogiri'
require 'uri'
require 'data_magic'
require 'net/http'
require 'active_support'
require 'active_support/core_ext'
require 'pry-byebug'
require 'pry-awesome_print'
require 'minitest/spec'
require_relative '../support/pages/namespace_builder.rb'
require_relative '../support/pages/application.rb'
require_relative '../support/pages/login.rb'
require_relative '../support/pages/products.rb'
require_relative '../support/pages/your_cart.rb'
require_relative '../support/pages/checkout_your_information.rb'
require_relative '../support/pages/checkout_overview.rb'

World(MultiTest::MinitestWorld,
      PageObject::PageFactory)

# Initializes app specific class which will then set @current_page
def set_current_page(klass)
  on("Pages::#{klass}")
end