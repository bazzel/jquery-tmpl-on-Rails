class RecipesController < ApplicationController
  def index
    params[:per_page] ||= 5
    @recipes = Recipe.paginate :page => params[:page], :per_page => params[:per_page]
    
    respond_to do |wants|
      wants.html {  }
      wants.js do
        render :text => {
          :recipes => @recipes,
          :page => @recipes.next_page
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
