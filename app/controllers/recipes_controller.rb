class RecipesController < ApplicationController
  def index
    params[:per_page] ||= 10
    @recipes = Recipe.paginate :page => params[:page], :per_page => params[:per_page]
    
    respond_to do |wants|
      wants.html {  }
      wants.js do
        # render :json => @recipes
        # render :text => '{"recipes" : [{"recipe": {"name" : "Foo", "id" : 1}}, {"recipe": {"name" : "Bar", "id" : 2}}], "per_page" : 10}'
        # render :text => '{"recipes" : ' + @recipes.to_json + ', "per_page" : ' + @recipes.per_page + '}'

        render :text => {
          :recipes => @recipes,
          :current_page => @recipes.current_page,
          :per_page => @recipes.per_page,
          :total_entries => @recipes.total_entries
        }.to_json

      end
    end
    
  end
  
  def show
    @recipe = Recipe.find(params[:id])
  end
  
  def new
    @recipe = Recipe.new
  end
  
  def create
    @recipe = Recipe.new(params[:recipe])
    if @recipe.save
      flash[:notice] = "Successfully created recipe."
      redirect_to @recipe
    else
      render :action => 'new'
    end
  end
  
  def edit
    @recipe = Recipe.find(params[:id])
  end
  
  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.update_attributes(params[:recipe])
      flash[:notice] = "Successfully updated recipe."
      redirect_to @recipe
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    flash[:notice] = "Successfully destroyed recipe."
    redirect_to recipes_url
  end
end
