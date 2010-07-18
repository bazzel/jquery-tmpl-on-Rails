module JqueryTmpl

  # Add a class method 'jquery_tpl' to all models.
  # This method returns an object where all attributes
  # are strings in a format useable by jquery.tmpl.
  # If you pass a template object as an object when rendering
  # a partial, this will get you a piece of HTML to be used
  # as a jquery.tmpl.
  # See http://github.com/nje/jquery-tmpl
  def jquery_tmpl
    template = new
    
    # Returns for every attribute of the ActiveRecord object
    # a string which represents the jquery.tmpl placeholder
    # to be used in your templates.
    #   tmpl = Recipe.template
    #   tmpl.id                    # => "${ recipe['id'] }"
    #   tmpl.name                  # => "${ recipe['name'] }"
    #   tmpl.created_at            # => "${ recipe['created_at'] }"
    #   tmpl.updated_at            # => "${ recipe['updated_at'] }"
    template.class_eval do
      (template.attribute_names << "id").each do |attr|
        define_method(attr.to_sym) do
          "${ #{self.class.class_name.underscore}['#{attr}'] }"
        end
      end
    end
    
    return template
  end
  
end

ActiveRecord::Base.extend JqueryTmpl