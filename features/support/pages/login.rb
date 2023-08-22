module Pages
  class Login < Application
    div(:page_loaded, class: 'login-box', visible: true)
    text_field(:user_name, id: 'user-name')
    text_field(:password, id: 'password')
    button(:login, id: 'login-button')

    # This method helps user to login with their username and password and waits until product page is present
    #
    # @param username [String] user's username to login
    # @param password [String] user's password to login
    #
    # @return [Boolean]
    def login_with(username, password)
      self.user_name = username
      self.password = password
      login
      logged_in = on(Pages::Products).page_loaded?
    end
  end
end