module Pages
  class Application < NamespaceBuilder
    include PageObject
    include PageFactory

    button(:menu, id: 'react-burger-menu-btn', text: 'Open Menu', visible: true)
    link(:checkout, id: 'Logout', visible: true)
    link(:logout, id: 'logout_sidebar_link', visible: true)

    # This method logs out of the application
    def log_out
      self.menu
      self.logout
    end
  end
end