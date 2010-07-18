require 'spec_helper'

describe Recipe do
  describe "template" do
    it "returns attribute values as jqery.tmpl placeholder" do
      jquery_tmpl = Recipe.jquery_tmpl
      
      jquery_tmpl.id.should eql("${ recipe['id'] }")
      jquery_tmpl.name.should eql("${ recipe['name'] }")
      jquery_tmpl.created_at.should eql("${ recipe['created_at'] }")
      jquery_tmpl.updated_at.should eql("${ recipe['updated_at'] }")
    end
  end
end
