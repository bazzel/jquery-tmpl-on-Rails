require 'spec_helper'

describe Recipe do
  describe "template" do
    it "returns attribute values as jqery.tmpl placeholder" do
      template = Recipe.template
      
      template.id.should eql("${ recipe['id'] }")
      template.name.should eql("${ recipe['name'] }")
      template.created_at.should eql("${ recipe['created_at'] }")
      template.updated_at.should eql("${ recipe['updated_at'] }")
    end
  end
end
