module Pages
  class NamespaceBuilder
    include PageObject
    include PageFactory

    # Builds current Page
    # def build_current_page(base_module: 'Pages', workflow: nil)
    #   namespace = PageObject::NamespaceBuilder.new.build_namespace(base_module, workflow)
    #   visit(namespace)
    # end

    # Returns the namespace path for workflow class
    def build_namespace(base_module, workflow)
      workflow = workflow.gsub(' ','')
      return base_module + '::' + workflow
    end

    # Returns PageObject element name for given field name
    def page_object_name(str)
      page_object = str.gsub(/[^0-9A-Za-z%?#\-\s_\/]/, '')
                       .strip # Strip any leading and trailing spaces
                       .gsub(/[\s-]/, '_') # Replace spaces and hyphens with underscore
                       .gsub("/", '_') # Replace slash with underscore
                       .downcase # Downcase to match case of PageObject names

      return page_object + '_element'
    end
  end
end

