class CategoriesController < ApplicationController
  def show
    @cart = current_cart
    @products = Category.find(params[:id]).products
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @category }
    end
  end
end
