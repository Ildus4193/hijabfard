class CategoriesController < ApplicationController
  def show
    @cart = current_cart
    @products = Category.find(params[:id]).products.paginate(:page => params[:page], :per_page => 6)

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @category }
    end
  end
end
