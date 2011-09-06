class CategoriesController < ApplicationController
  def show
    @products = Category.find(params[:id]).products
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @category }
    end
  end
end
